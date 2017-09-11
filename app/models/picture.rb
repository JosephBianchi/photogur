class Picture < ActiveRecord::Base

  belongs_to :user

  validates :artist, presence: true
  validates :title, length: {minimum: 2}
  validates :title, length: {maximum: 20}
  validates :url, presence: true
  validates :url, uniqueness: true







  def self.newest_first
     Picture.order("created_at DESC")
   end

   def self.most_recent_five
     Picture.newest_first.limit(5)
   end

   def self.created_before(time)
     Picture.where("created_at < ?", time)
   end

   def self.created_in_year(year)
     year_start = Date.parse("#{year}-01-01")
     year_end = Date.parse("#{year}-12-31")
     Picture.where("created_at >= ? AND created_at <= ?", year_start, year_end)
   end

end
