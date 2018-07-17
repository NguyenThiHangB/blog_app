User.create!(name:  "HangNguyen",
             email: "nguyenthihang.mdc@gmail.com",
             password: "12345678",
             password_confirmation: "12345678",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

30.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  password = "123456"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.take(6)
25.times do
  title = Faker::Lorem.sentence(1)
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.entries.create!(title: title, content: content)}
end

users = User.all
user  = users.first
following = users[2..20]
followers = users[3..10]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
