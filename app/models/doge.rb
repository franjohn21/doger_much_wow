class Doge < ActiveRecord::Base
  validates_presence_of :content
  validates :content, length: {maximum: 70,
    too_long: "%{count} characters is the maximum allowed" }
  has_many :retweets
  has_many :retweeters, :through => :retweets, :foreign_key => :user
end
