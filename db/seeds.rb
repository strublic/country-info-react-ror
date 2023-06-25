# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts 'Seeding...🚀'
sleep 1 #take a break :)

puts 'Creating user...🏃'
User.create(username: "teste", password:"teste")
sleep 1

puts 'Creating countries...💤'
Country.create([
  {name: "Brasil", capital_city: "Brasília", area_total: 8510345, population_size: 213317639, desc: "Considerado uma das maiores economias do mundo, o país apresenta enorme biodiversidade."},
  {name: "Argentina", capital_city: "Buenos Aires", area_total: 2796427, population_size: 45606000, desc: "O tango é um dos principais símbolos da Argentina, e é considerado um patrimônio mundial."},
  {name: "USA", capital_city: "Washington", area_total: 9834000, population_size: 331449281 , desc: "Considerados a maior potência mundial, o país exerce influência econômica, militar, política e cultural globalmente."},
  {name: "França", capital_city: "Paris", area_total: 551695, population_size: 62636580, desc: "Maior produtor de energia nuclear do mundo, se destaca no setor da indústria de automóveis e eletrônica."},
  {name: "Irlanda", capital_city: "Dublin", area_total: 70273, population_size: 4962603, desc: "Sua capital, Dublin, é berço de escritores como Oscar Wilde e local de origem da cerveja Guinness."},
  {name: "Japão", capital_city: "Tokio", area_total: 377973, population_size: 126476000, desc: "Possui a maior expectativa de vida do mundo: quase 84 anos. É comum que as pessoas passem dos 100 anos."},
  {name: "Austrália", capital_city: "Camberra", area_total: 7688000, population_size: 26755511, desc: "O país é marcado pelo multiculturalismo, com forte presença das culturas indígenas e de imigrantes."},
  {name: "Nova Zelândia", capital_city: "Wellington", area_total: 268021, population_size: 5123000, desc: "Famosa por garantir qualidade de vida à população."}
])
sleep 1

puts ">>> finish 🏁🎉"