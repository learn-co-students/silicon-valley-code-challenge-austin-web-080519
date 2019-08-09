require_relative 'venture_capitalist'
require_relative 'funding_round'

class Startup

    attr_reader :founder, :domain, :name
    attr_accessor :fund

    @@all = []

    def initialize(name, founder, domain, fund=0)
        @name = name
        @founder = founder
        @domain = domain
        @fund = fund
        @@all << self
    end
    
    def pivot(new_domain, new_name)
        @domain = new_domain
        @name = new_name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(iamfounderof)
        self.all.find {|startup| startup.founder == iamfounderof}
        #all_startups.map.first.name {|startup| startup.founder == iamfounderof}
    end

    def self.domains
        self.all.collect {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        new_round = FundingRound.new(self, venture_capitalist, type, investment)
    end

    #gets all funding rounds for specific startup
    def funding_rounds 
        FundingRound.all.select {|round| round.startup == self}
    end

    #Returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds
        self.funding_round.count
        #self.funding_round.length
    end

    #helper method for total_funds
    def investment_rounds
        funding_rounds.collect {|round| round.investment}
    end

    #Returns the total sum of investments that the startup has gotten
    def total_funds
        investment_rounds.inject{|sum,investment| sum + investment}
    end

    #Returns a unique array of all the venture capitalists that have invested 
    #in this company
    def investors
        funding_rounds.collect {|round| round.venture_capitalist}.uniq
    end

    #Returns a unique array of all the venture capitalists that have invested in this 
    #company and are in the Trés Commas club
    def biginvestors
        tres = VentureCapitalist.tres_commas_club
        uniqinvestors = self.investors
        self.investors.select {|round| round}
    end



end
