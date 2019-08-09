require_relative 'funding_round'
require_relative 'venture_capitalist'
require_relative 'startup'
require 'pry'


airbnb = Startup.new("Airbnb", "A guy", "Hotels")
homeaway = Startup.new("VRBO", "A gal", "Hotels")
google = Startup.new("Google", "Two Guys", "Search")
yahoo = Startup.new("Yahoo", "Unknown", "Search")


joe = VentureCapitalist.new("Joe", 1000)
sarah = VentureCapitalist.new("Sarah", 2000)
kyle = VentureCapitalist.new("Kyle", 3000)
leslie = VentureCapitalist.new("Leslie", 40000000)
puts VentureCapitalist.tres_commas_club


airbnb_angel = FundingRound.new(airbnb, joe, "Angel", 500)
homeaway_seriesA = FundingRound.new(homeaway, sarah, "Series A",1000)
google_preSeed = FundingRound.new(google, kyle, "Pre-Seed", 1500)
yahoo_seriesC = FundingRound.new(yahoo, leslie, "Series C", 10)
google.sign_contract("Angel", leslie, 1000)