class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_presence_of :username

  has_many :doges

  def feed
    self.doges
  end

end
