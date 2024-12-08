class User::Address
  include ActiveModel::API
  include ActiveModel::Attributes

  attribute :country
  attribute :city
  attribute :street
  attribute :zip

  validates :country, :zip, presence: true
end
