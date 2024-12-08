class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  store :address, coder: JSON

  validate do |record|
    next if address.valid?

    record.errors.add(:address, "is invalid")
  end

  def address() = @address ||= Address.new(super)
end
