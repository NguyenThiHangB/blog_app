User.create!(name:  "HangNguyen",
             email: "nguyenthihang.mdc@gmail.com",
             password: "12345678",
             password_confirmation: "12345678",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

20.times do |n|
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
