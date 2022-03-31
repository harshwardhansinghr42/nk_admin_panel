class User < ApplicationRecord
  enum status: [:non_verified, :verified, :deactivated]
  validates :phone, presence: true,
                    numericality: { greater_than_or_equal_to: 0 },
                    length: { is: 10 }

  has_many :product_likes
  has_many :product_comments
  
  def generate_registration_otp
    self.otp = rand(1000...9999)
    self.otp_created_at = Time.now
  end

  def send_registration_otp
    SmsService.new(phone, registration_otp_text).send_sms
  end

  def verify_otp(otp)
    return false if Time.now - otp_created_at > 10.minutes
    return false unless otp == self.otp

    # otp_confirmed_at column can be deleted, looks like not required
    self.otp_confirmed_at = Time.now
    self.status = :verified
    save!
  end

  private

  def registration_otp_text
    "Please use #{otp} as otp to verify your phone number"
  end
end
