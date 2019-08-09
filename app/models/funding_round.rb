class FundingRound

attr_reader :startup, :vc, :investment, :type

    @@all = []

    def initialize(startup, vc, investment, type)
        @startup = startup
        @venture_capitalist = vc
        @investment = investment
        @type = type

        @@all << self
    end
 
    def self.all
        @@all
    end

    def self.startup.select {|startup| }
end
