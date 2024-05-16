class PatientsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      PatientRegistrationMailer.confirmation_email(@patient).deliver_later
      
      render json: { message: 'Patient registered successfully' }, status: :created
    else
      render json: { errors: @patient.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def show
    render json: Patient.find(params[:id]), status: :ok
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :email, :phone_number, :document_photo)
  end
end
