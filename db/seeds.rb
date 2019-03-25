# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Mural.destroy_all
Wall.destroy_all
Job.destroy_all
Message.destroy_all


users = [
  {name: "Kyle", username: "kyle", password: "password", usertype: "muralist"},
  {name: "Ross", username: "ross", password: "password", usertype: "muralist"},
  {name: "Artem", username: "artem", password: "password", usertype: "muralist"},
  {name: "Anthony", username: "anthony", password: "password", usertype: "muralist"},
  {name: "Hai", username: "hai", password: "password", usertype: "muralist"},
  {name: "Phil", username: "phil", password: "password", usertype: "muralist"},
  {name: "Ben", username: "ben", password: "password", usertype: "muralist"},
  {name: "Andrea", username: "andrea", password: "password", usertype: "muralist"},
  {name: "Chine", username: "Chine", password: "password", usertype: "muralist"},
  {name: "Shannon", username: "shannon", password: "password", usertype: "wallist"},
  {name: "Chris", username: "chris", password: "password", usertype: "wallist"},
  {name: "Heloise", username: "heloise", password: "password", usertype: "wallist"},
  {name: "Mathew", username: "mathew", password: "password", usertype: "wallist"},
  {name: "Ryan", username: "ryan", password: "password", usertype: "wallist"},
  {name: "Shinik", username: "shinik", password: "password", usertype: "wallist"},
  {name: "Benjamin", username: "benjamin", password: "password", usertype: "wallist"},
  {name: "James", username: "james", password: "password", usertype: "wallist"},
  {name: "Serven", username: "serven", password: "password", usertype: "wallist"}
]

allUsers = users.map {|user| User.create(user)}

3.times do |i|
  allUsers.each do |user|
    if user.usertype == "muralist"
      Mural.create(image:"http://www.artisa.co.za/wp-content/uploads/2017/07/Artwork-Placeholder-feature-1-300x300.jpg", rating: rand(1..5), user_id: user.id)
    else
      Wall.create(image:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Brick_wall_close-up_view.jpg/220px-Brick_wall_close-up_view.jpg", location: "Somewhere, USA", user_id: user.id)
    end
  end
end

muralist_array = allUsers.select {|user| user.usertype == "muralist"}
wallist_array = allUsers.select {|user| user.usertype == "wallist"}

jobs = muralist_array.map.with_index do |muralist, index|
  Job.create(active: true, accepted: true, title: "Fake Job #{index}", requester: wallist_array[index], requestee: muralist)
end

messages = jobs.map do |job|
  Message.create(job: job, content: "lorem ipsum doooooooooooooooooooooood!!!!", user: job.requester)
  Message.create(job: job, content: "Noooooooooo WAAAAAAYYYY!!", user: job.requestee)
  Message.create(job: job, content: "WAAAAAAYYYYYYYY!!!!!!", user: job.requester)
  Message.create(job: job, content: "I QUIT!!!", user: job.requestee)
end
