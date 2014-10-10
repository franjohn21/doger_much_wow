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
    user_doges = self.doges
    user_doges += self.very_wows
    self.followees.each do |followee|
      user_doges += followee.doges
      user_doges += followee.very_wows
    end
    user_doges.sort_by{|doge| doge.created_at}.reverse
  end

end
