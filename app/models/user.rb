class User < ActiveRecord::Base
 
  has_many :upvotes
  has_many :songs
  
  validates :name, presence: true, length: { maximum: 80 }
  validates :email, presence: true, length: { maximum: 150 }
  validates :password, presence: true, length: { maximum: 18 }

end
