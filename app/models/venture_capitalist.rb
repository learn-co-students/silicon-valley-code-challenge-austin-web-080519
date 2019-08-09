class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.collect {|vcs| vcs.total_worth > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    #returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    #Returns a unique list of all startups this venture capitalist has funded
    def portfolio
        funding_rounds.collect {|round| round.startup}
    end

    #returns the largest funding round given by this venture capitalist
    def biggest_investment
       # funding_rounds.max {|a, b| a.investment <==> b.investment}
    end

    #given a domain string, returns the total amount invested in that domain
    def invested(thedomain)
        #can use portfolio to dig in to startups invested where domain name matches
        #then return results of just the investments for each of those results
        #self.portfolio.collect {||}
    end

end


#inject method