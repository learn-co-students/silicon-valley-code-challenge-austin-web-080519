require_relative 'startup'
require_relative 'venture_capitalist'
require_relative 'funding_round'
require 'pry'

noodles = Startup.new("Noodles", "Jason", "food")
gadgets = Startup.new("Gadgets", "Nathan", "tech")

timmy = VentureCapitalist.new("Timmy", 7777777)
noah = VentureCapitalist.new("Noah", 142345713213)
adam = VentureCapitalist.new("Adam", 31213123213)
todd = VentureCapitalist.new("Todd", 38219374)

fr1 = noodles.sign_contract(timmy, "Seed A", 400000)
fr2 = noodles.sign_contract(noah, "Seed B", 600000)
fr3 = gadgets.sign_contract(adam, "Seed C", 1000000)
fr4 = gadgets.sign_contract(todd, "Seed A", 500000)

offer1 = noah.offer_contract(gadgets, "Seed A", 300000)












binding.pry