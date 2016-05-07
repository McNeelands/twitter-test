class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :content, length: { maximum: 140 }

  def like_count
    self.likes.size
 end

 self.per_page = 10
end
