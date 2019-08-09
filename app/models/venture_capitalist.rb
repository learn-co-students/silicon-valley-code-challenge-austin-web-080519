require_relative 'startup'
require_relative 'funding_round'

class VentureCapitalist

    attr_accessor :name, :total_worth, :funding_round

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @funding_round = funding_round
        @@all << self

    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth > 1000000}
    end
    # will need to return an array (self?) of all venture capitalists AND their total_worth
    

end
