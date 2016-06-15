require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :upvotes
  has_many :songs
  
  validates :name, presence: true, length: { minimum: 4, maximum: 80 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 6, maximum: 150 }
  validates :password, presence: true, length: { minimum: 4, maximum: 254 }

    # Getter
  def password
    @password ||= Password.new(password_hash)
  end

  # Setter
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
