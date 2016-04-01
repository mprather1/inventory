class Device < ActiveRecord::Base

  belongs_to :user

  scope :sorted, lambda { order("serial_number ASC")}
  def self.search(query)
    where("serial_number like ?", "%#{query}%")
  end

end
