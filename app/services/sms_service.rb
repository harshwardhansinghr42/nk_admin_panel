class SmsService
  attr_reader :phone, :message

  def initialize(phone, message)
    @phone = phone
    @message = message
  end

  def send_sms
    # implement messaging here
  end
end