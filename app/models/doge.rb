class Doge < ActiveRecord::Base
  validates_presence_of :content
  has_many :retweets
  has_many :retweeters, :through => :retweets, :foreign_key => :user
end
