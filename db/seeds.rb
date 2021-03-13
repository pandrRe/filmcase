# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

directors = Director.create([
  { name: 'Quentin', surname: 'Tarantino' },
  { name: 'Martin', surname: 'Scorsese'},
])

Film.create([
  { title: 'Silence', year: 2016, synopsis: 'Christians in Japan.', director: directors.last, rating: 5, url: "https://i.pinimg.com/originals/6b/c0/d0/6bc0d0263cfa115bfef1f2534c715b6c.jpg" },
  { title: 'Kill Bill Vol 1', year: 2003, synopsis: 'A bride in search for revenge.', director: directors.first, rating: 5, url: "https://m.media-amazon.com/images/M/MV5BNzM3NDFhYTAtYmU5Mi00NGRmLTljYjgtMDkyODQ4MjNkMGY2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY1200_CR85,0,630,1200_AL_.jpg" },
  { title: 'The Irishman', year: 2019, synopsis: 'A tale about crime and old men.', director: directors.last, rating: 5, url: "https://upload.wikimedia.org/wikipedia/en/8/80/The_Irishman_poster.jpg" },
  { title: 'Taxi Driver', year: 1976, synopsis: 'A taxi driver roams around New York at night.', director: directors.last, rating: 5, url: "https://upload.wikimedia.org/wikipedia/pt/thumb/3/33/Taxi_Driver_%281976_film_poster%29.jpg/200px-Taxi_Driver_%281976_film_poster%29.jpg" },
  { title: 'Kill Bill Vol 2', year: 2004, synopsis: 'The final chapter of Beatrix Kiddo\'s revenge', director: directors.first, rating: 5, url: "https://upload.wikimedia.org/wikipedia/en/thumb/c/c4/Kill_Bill_Volume_2.png/220px-Kill_Bill_Volume_2.png" },
])