class User < ActiveRecord::Base

  scope :sorted, lambda { order("last_name ASC, first_name ASC")}

  has_secure_password validations: false

  has_many :devices

  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation
  validates_confirmation_of :password

  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 50 }
  validates :username, :presence => true, :length => { :within => 4..25 }, :uniqueness => true

  def name
    "#{first_name} #{last_name}"
  end

  def self.search(query)
    where("username like ?", "%#{query}%")
  end

end
