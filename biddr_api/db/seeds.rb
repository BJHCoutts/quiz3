PASSWORD = "supersecret"

User.destroy_all
Auction.destroy_all
Bid.destroy_all

# 20.times { Tag.create label: Faker::Pokemon.name }

# super_user = User.create(
#   first_name: "Jon",
#   last_name: "Snow",
#   email: "js@winterfell.gov",
#   password: PASSWORD,
#   admin: true
# )

10.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    # password: PASSWORD
  )
end

# users = User.all

# puts Cowsay.say "Created #{users.count} users", :tux

100.times.each do 
  a = Auction.create(
    title: Faker::Pokemon.name,
    body: Faker::Fallout.quote,
    # user: users.sample
  )

  # if q.valid?
  #   rand(0..10).times.each do
  #     a = Answer.create(
  #       body: Faker::Fallout.quote,
  #       question: q,
  #       user: users.sample
  #       )
      
  #     if a.valid?
  #       users.shuffle[0..4].each do |u|
  #         Vote.create answer: a, user: u, up: [true, false].sample
  #       end
  #     end
  #   end

  #   users.shuffle[0..2].each do |u|
  #     Like.create question: q, user: u
  #   end

  # end


end

users = User.all
auctions = Auction.all
bids = Bid.all

puts Cowsay.say "Created #{users.count} users", :ren
puts Cowsay.say "Created #{auctions.count} auctions", :stimpy
puts Cowsay.say "Created #{bids.count} bids", :sheep

# puts "Login with #{super_user.email} and password of '#{PASSWORD}'"AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?