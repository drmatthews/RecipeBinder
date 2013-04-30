namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_relationships
  end
end

def make_users
    admin = User.create!(name: "Daniel Matthews",
                 email: "ebbwdan@gmail.com",
                 password: "E6eanor6",
                 password_confirmation: "E6eanor6")
    admin.toggle!(:admin)
  9.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..5]
  followers = users[3..4]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end