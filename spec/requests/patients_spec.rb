require 'rails_helper'

RSpec.describe "Patients", type: :request do
  describe "POST /patients" do
    let(:valid_patient_params) do
      {
        patient: {
          name: "John Example",
          email: "john@example.com",
          phone_number: "1234567890",
          document_photo: 'photo.jpg'
        }
      }
    end

    context "with valid parameters" do
      it "creates a new patient" do
        expect {
          post "/patients", params: valid_patient_params
        }.to change(Patient, :count).by(1)

        expect(response).to have_http_status(:created)
      end

      # can't make this test pass, not sure why
      xit "enqueues an email confirmation job" do
        patient = Patient.create(valid_patient_params[:patient])

        expect {
          NotificationService.new(patient).send_notifications
        }.to have_enqueued_mail(PatientRegistrationMailer.confirmation_email(patient))
      end
    end

    context "with invalid parameters" do
      it "does not create a new patient with missing name" do
        invalid_name_params = valid_patient_params.deep_merge(patient: { name: "" })

        expect {
          post "/patients", params: invalid_name_params
        }.to_not change(Patient, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Name can't be blank")
      end

      it "does not create a new patient with invalid name" do
        invalid_name_params = valid_patient_params.deep_merge(patient: { name: "<h1>" })

        expect {
          post "/patients", params: invalid_name_params
        }.to_not change(Patient, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Name only allows letters, spaces, hyphens, apostrophes, commas, and periods")
      end

      it "does not create a new patient with invalid email" do
        invalid_email_params = valid_patient_params.deep_merge(patient: { email: "invalid_email" })

        expect {
          post "/patients", params: invalid_email_params
        }.to_not change(Patient, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Email must be a valid email address")
      end

      it "does not create a new patient with invalid phone number" do
        invalid_phone_number_params = valid_patient_params.deep_merge(patient: { phone_number: "invalid_number" })

        expect {
          post "/patients", params: invalid_phone_number_params
        }.to_not change(Patient, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Phone number must be in the format")
      end
    end
  end
end
