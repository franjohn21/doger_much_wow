require 'faker'

10.times {User.create(username: Faker::Internet.user_name, password_hash: Faker::Internet.password)}
20.times {Doge.create(content: Faker::Company.bs, user_id: rand(1..10))}
10.times  do |x|
  User.all.each do |user|
    user.followees << User.create(username: Faker::Internet.user_name, password_hash: Faker::Internet.password)
  end
end
