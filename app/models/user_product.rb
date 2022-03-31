class UserProduct < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :address

  attr_accessor :payment

  def payment
    "hey"
  end
end
