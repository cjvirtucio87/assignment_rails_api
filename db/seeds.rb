# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Review.destroy_all
Movie.destroy_all

SEED = 10

SEED.times do |idx|
  movie = Movie.create({title: Faker::Hipster.words(5).join(' '),
                        release_date: Faker::Date.between(50.years.ago,Date.today)})
  5.times do |idx|
    movie.reviews.create ({reviewer_name: Faker::Hipster.words(2).join(' '),
                          title: Faker::Hipster.sentences(1)[0],
                          review_text: Faker::Hipster.sentences(4).join("\n"),
                          review_date: Faker::Date.between(50.years.ago,Date.today)})
  end

  movie.save
end
