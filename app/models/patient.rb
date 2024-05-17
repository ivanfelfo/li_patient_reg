class Patient < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[A-Za-z\s\-',.]+\z/, message: "only allows letters, spaces, hyphens, apostrophes, commas, and periods" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :phone_number, presence: true, length: {is: 10}, format: { with: /\A\d{3}[-.]?\d{3}[-.]?\d{4}\z/, message: "must be in the format xxx-xxx-xxxx or xxx.xxx.xxxx" }
  validates :document_photo, presence: true # tried using ActiveStorage to validate but couldn't make it work 8'(
end
