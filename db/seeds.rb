puts 'Creating platforms'
platforms_data = JSON.parse(File.read("db/platforms.json"), symbolize_names: true)
platforms_data.each do |platform_data|
    Platform.create(platform_data)
end
puts 'Platforms created'

puts 'Creating genres'
Genre.destroy_all
genres_data = JSON.parse(File.read("db/genres.json"), symbolize_names: true)
genres_data.each do |genre_name|
    Genre.create(name: genre_name)
end
puts 'Genres created'

puts 'Creating companies'
Company.destroy_all
companies_data = JSON.parse(File.read("db/companies.json"), symbolize_names: true)
companies_data.each do |company_data|
    Company.create(company_data)
end
puts 'Companies created'

puts 'Creating games and relationships'
Game.destroy_all
games_data = JSON.parse(File.read("db/games.json"), symbolize_names: true)
games_data.each do |game_data|
  game = {
    name: game_data[:name],
    summary: game_data[:summary],
    release_date: game_data[:release_date],
    category: game_data[:category],
    rating: game_data[:rating],
    parent: Game.find_by(name: game_data[:parent])
  }
  new_game = Game.create(game)

  game_data[:platforms].each do |platform_data|
    platform = Platform.find_by(name: platform_data[:name])
    new_game.platforms << platform
  end

  game_data[:genres].each do |genre_name|
    genre = Genre.find_by(name: genre_name)
    new_game.genres << genre
  end

  game_data[:involved_companies].each do |involv_comp_data|
    company = Company.find_by(name: involv_comp_data[:name])
    new_involved_company = {
      developer: involv_comp_data[:developer],
      publisher: involv_comp_data[:publisher],
      company: company
    }
    new_game.involved_companies.create(new_involved_company)
  end
end
puts 'games and relationships created'

puts 'Creating cover'
Game.find_by(name:'The Last of Us').update(cover: {io: File.open('db/seeds_images/image_40.png'), filename: 'the_last_of_us.jpg'})
Game.find_by(name:'Borderlands 3').update(cover: {io: File.open('db/seeds_images/image_41.png'), filename: 'borderlands3.jpg'})
puts 'Cover created'