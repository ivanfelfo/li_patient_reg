class PatientRegistrationMailer < ApplicationMailer
  def confirmation_email(patient)
    @patient = patient
    mail(to: @patient.email, subject: 'Patient Registration Confirmation')
  end
end
