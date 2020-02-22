FactoryBot.define do
  factory :user do
    name { 'admin_user' }
    email { '1@gmail.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin {true}
  end

  factory :user1 , class: User do
    name { "user2" }
    email { "2@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
    admin {true}
  end

  factory :user2 , class: User do
    name { "user3" }
    email { "3@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
    admin {false}
  end

end
