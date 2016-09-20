class Campaign < ActiveRecord::Base
  belongs_to :client
  has_many :ads, dependent: :destroy
end
