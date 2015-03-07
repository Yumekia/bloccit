 require 'faker'
 
 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

 30.times do
 	Post.create!(
 		title: Faker::Lorem.characters,
 		body: Faker::Lorem.words
 	)
end
posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

 60.times do
 	Comment.create!(
      post: posts.sample,
      body: Faker::Lorem.words
 	)
 end

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"