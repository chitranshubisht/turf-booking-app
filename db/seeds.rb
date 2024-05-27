# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

facilities = [
  { name: 'Cricket', description: 'Outdoor cricket field', location: 'HSR Layout', images: 'https://www.shutterstock.com/image-illustration/illuminated-round-cricket-stadium-full-260nw-1393589660.jpg' },
  { name: 'Badminton', description: 'Indoor badminton court', location: 'E city', images: 'https://img.olympics.com/images/image/private/t_s_pog_staticContent_hero_lg/f_auto/primary/kfsyzuaoipfhm4qonqci' },
  { name: 'Snooker', description: 'Indoor snooker table', location: 'Indiranagar', images: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvMyj_7uRPWT-jp5EQ6TRJl4ysl0uY-o3gczQSZjMzr7McgZ3QKsdqdhEgfBs4zxj82XM&usqp=CAU' },
  { name: 'Football', description: 'Outdoor football field', location: 'Hebbal', images: 'https://www.shutterstock.com/image-photo/american-football-arena-yellow-goal-600nw-2357573507.jpg' },
  { name: 'Tennis', description: 'Outdoor tennis court', location: 'Marathalli', images: 'https://www.krg.nsw.gov.au/files/assets/public/v/1/images/1-things-to-do/tennis-courts/community-services_recreation-morona-avenue-tennis-court_september-2008-3_1140x570px.jpg?dimension=pageimagefullwidth&w=1140&h=570' }
]

facilities.each do |facility|
  Facility.find_or_create_by(name: facility[:name]) do |f|
    f.description = facility[:description]
    f.location = facility[:location] 
    f.images = facility[:images]
  end
end