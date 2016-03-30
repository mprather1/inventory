class User < ActiveRecord::Base
  has_many :devices

  def name
    "#{first_name} #{last_name}"
  end
end
