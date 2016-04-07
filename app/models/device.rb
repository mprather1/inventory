class Device < ActiveRecord::Base

  belongs_to :user

  scope :sorted, lambda { order("serial_number ASC")}

  validates :serial_number, presence: true

  def self.search(query)
    where("serial_number ILIKE :query OR device_type ILIKE :query", query: "%#{query}%")
end


end
