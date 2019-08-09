require_relative 'venture_capitalist'
require_relative 'funding_round'

class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        Startup.all.find {|startup| startup.founder == founder_name}
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.domains
        Startup.all.collect {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
         FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_round
      self.funding_rounds.size
    end

    def funding_rounds
        FundingRound.all.select {|f| f.startup == self}
    end

    def total_funds
        round_investments = self.funding_rounds.collect {|f| f.investment}
        round_investments.inject {|sum, i| sum + i}
    end

    def investors
        self.funding_rounds.collect {|f| f.venture_capitalist}
    end

    def big_investors
       investors.select {|i| i.total_worth >= 1000000000}
    end
end