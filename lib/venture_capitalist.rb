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
        VentureCapitalist.all.select {|investor| investor.total_worth >= 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|f| f.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.collect {|f| f.startup}
    end

    def biggest_investment
        funding_rounds.max {|a, b| a.investment <=> b.investment}
    end
    
    def invested(domain_name)
        domain_rounds = self.funding_rounds.select {|f| f.startup.domain == domain_name}
        invested_domain_rounds = domain_rounds.collect {|f| f.investment}
        invested_domain_rounds.inject {|sum, i| sum + i}        
    end
end