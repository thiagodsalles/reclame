Complaint.create(title: 'Meu celular não liga', description: 'Meu celular deu tela branca e ele não inicia',
                 company: 'Ponto Frio', country: 'Brasil', state: 'Rio de Janeiro', city: 'Rio de Janeiro',
                 latitude: '-22.9905557', longitude: '-43.4627601', suburb: 'Vargem Pequena')

10.times do
  Complaint.create(title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph,
                   company: Faker::Company.name, country: Faker::Address.country, state: Faker::Address.state,
                   city: Faker::Address.city, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude,
                   suburb: Faker::Address.street_name)
end
