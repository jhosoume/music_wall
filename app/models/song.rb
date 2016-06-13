class Song < ActiveRecord::Base
  
  validates :title, presence: true, length: { maximum: 150 }
  validates :author, presence: true, length: { maximum: 80 }
  validates :url, length: { maximum: 254 }

end
