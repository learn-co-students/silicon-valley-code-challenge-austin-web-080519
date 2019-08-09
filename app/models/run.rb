
require 'pry'
require_relative 'startup.rb'
require_relative 'venture_capitalist.rb'
require_relative 'funding_round.rb'

#Company 1
#Startup = Instacart
#Founder = Apoorva Mehta
#Domain = Grocery Delivery
#VentureCapitalist = Sequoia Capital, Khosla Ventures
#FundingRound = Series A at 8,500,000, Series B at 44,000,000

#Company 2
#Startup = Uber
#Founder = Travis Kalanick
#Domain = Ridesharing
#VentureCapitalist = , Khosla Ventures
#FundingRound = Series A at 8,500,000, Series B at 44,000,000

#Lifecycle of a new startup
instacart = Startup.new("Instacart", "Apoorva Mehta", "Grocery Delivery")
uber = Startup.new("Uber", "Travis Kalanick", "Ridesharing")
cloudkitchens = Startup.new("Cloud Kitchens", "Travis Kalanick", "Express Kitchens")

puts "======BEGINNING============="
puts instacart.name == "Instacart"
puts instacart.founder == "Apoorva Mehta"
puts instacart.domain ==  "Grocery Delivery"
puts "----checked new method----"
instacart.pivot("Food Delivery", "Instafood")
puts instacart.name == "Instafood"
puts instacart.domain == "Food Delivery"
puts "----checked pivot method----"
puts Startup.all
puts "----checked all method----"
puts Startup.find_by_founder("Travis Kalanick") == uber
puts "----checked founder to startup method----"
puts Startup.domains
puts "----checked domains method----"
puts "========END===================="
# #Lifecyle of a VC
# khosla = VentureCapitalist.new("Khosla", 768000)
# accel = VentureCapitalist.new("Accel", 400456899000)
# sequoia = VentureCapitalist.new("Sequoia", 13294898394)
