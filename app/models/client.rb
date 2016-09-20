class Client < ActiveRecord::Base
  belongs_to :agency
  has_many :campaigns, dependent: :destroy
  has_secure_password

  def is_client?
    self.has_attribute? :point_of_contact
  end

end
