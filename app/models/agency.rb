class Agency < ActiveRecord::Base
  has_many :clients
  has_secure_password
  has_many :campaigns, through: :clients

  # has_many :ads, through: :campaigns
  def is_client?
    self.has_attribute? :point_of_contact
  end
end
