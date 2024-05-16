class SendPatientRegistrationEmailJob < ApplicationJob
  queue_as :default

  def perform(patient)
    PatientRegistrationMailer.confirmation_email(patient).deliver_now
  end
end
