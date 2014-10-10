class Follow < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :followee, :class_name => 'User'
end
