class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_presence_of :username

  has_many :doges
  has_many :retweets
  has_many :very_wows, :through => :retweets, :source => :doge

  has_many :follows
  has_many :followees, :through => :follows, :class_name => 'User'
  has_many :followers, :through => :follows, :source => :user

  def feed
    self.doges
  end

end
