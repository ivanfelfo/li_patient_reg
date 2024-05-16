class NotificationService
  def initialize(patient)
    @patient = patient
  end

  def send_notifications
    send_email_notification
    # add method `send_sms_notification` when implemented
  end

  private

  def send_email_notification
    PatientRegistrationMailer.confirmation_email(@patient).deliver_later
  end

  def send_sms_notification
    # implement SMS sending logic
  end
end
