# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             screen_name: "exa001",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now,
             introduction: "Hello! This is example user ",
             phone_number: Faker::PhoneNumber.phone_number_with_country_code,
             birthday: "1993-06-06",
             url:"https://camp.potepan.com/",
             sex: "man"
             )

# 追加のユーザーをまとめて生成する
10.times do |n|
  name  = Faker::Name.name
  screen_name = Faker::Twitter.screen_name
  email = "example-#{n+1}@railstutorial.org"
  introduction = "Hello! This is example user "
  phone_number = Faker::PhoneNumber.phone_number_with_country_code
  birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
  password = "password"
  User.create!(name:  name,
               screen_name: screen_name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               introduction: introduction,
               phone_number: phone_number,
               birthday: birthday,
               url:"https://camp.potepan.com/",
               sex: "man"
               )
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
30.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user|
    @post =user.microposts.new(content: content) 
    @post.image.attach(io: File.open("app/assets/images/test_#{rand(1..10)}.jpg"), filename: "test_#{rand(1..10)}.jpg")
    @post.save
  }
  
end
#マイクロポストの一部を対象に一部ユーザーからのコメントを生成
microposts = Micropost.order(:created_at).take(30)
users      = User.order(:created_at).take(3)
microposts.each { |micropost|
  users.each { |user|
    content = Faker::Lorem.sentence(word_count: 3)
    Comment.create!(micropost_id: micropost.id,
                        content: content,
                        user_id: user.id)
  }
}


# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


#user = User.find(1)
#@micropost = user.microposts.last
#@micropost.image.attach(io: File.open('app/assets/images/test.jpg'))