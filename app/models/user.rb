class User < ActiveRecord::Base
  validates_uniqueness_of :username
  validates_presence_of :username

  has_many :doges
  
end
