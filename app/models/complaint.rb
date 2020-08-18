class Complaint < ApplicationRecord

  validates :title, :description, :company, :latitude, :longitude, presence: true

end
