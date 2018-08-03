u = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: '135246',
  role: :site_admin
)

3.times do |n|
  Topic.create!(title: Faker::Lorem.word)
end

puts "Topics created"

first_topic = Topic.first
10.times do |n|
  Blog.create!(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph,
    topic: first_topic
  )
end

puts 'Blog posts created'

5.times do |n|
  Skill.create!(
    title: Faker::ProgrammingLanguage.name,
    percent_utilized: rand(15..75)
  )
end

puts 'Skills creates'

9.times do |n|
  item = Portfolio.create!(
    title: Faker::Job.title,
    subtitle: Faker::Job.field,
    body: Faker::Lorem.paragraph,
    main_image: "https://placehold.it/600x400?text=#{n + 1}",
    thumb_image: "https://placehold.it/350x200?text=#{n + 1}",
    position: n + 1
  )

  3.times { item.technologies.create!(name: Faker::ProgrammingLanguage.name) }
end

puts 'Portfolios created'
