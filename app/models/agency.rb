class Agency < ActiveRecord::Base
  has_many :clients
  has_secure_password

  def is_client?
    self.has_attribute? :point_of_contact
  end
end
