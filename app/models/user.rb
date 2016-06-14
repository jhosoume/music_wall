class User < ActiveRecord::Base
 
  has_many :upvotes
  has_many :songs
  
  validates :name, presence: true, length: { minimum: 4, maximum: 80 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 6, maximum: 150 }
  validates :password, presence: true, length: { minimum: 4, maximum: 18 }

end
