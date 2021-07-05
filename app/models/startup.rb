require_relative "VentureCapitalist"
class Startup
    attr_accessor :numrounds, :total_funds
    attr_reader :name, :founder, :domain

    @@all = []
    def initialize(name, founder, domain, numrounds, total_funds)
        @name = name 
        @founder = founder 
        @domain = domain 
        @numrounds = 0
        @total_funds = total_funds
        @@all << self 
    end 
    def pivot(name, domain) #ask them about that 
        @name = name 
        @domain = domain
    end 
    def self.all
        @@all
    end 
    def self.find_by_founder(founder)
        self.all.find{|startup| startup.founder == founder}
    end #explain to instructr make sure i'm right
    end
    def self.domains(domain) 
        self.all.collect{|startup| startup.domain}
    end 
    end 
    def sign_contract(type, investment, venture_capitalist)
        FundingRound.new = fundinground(self, venture_capitalist, type, investment)
        @numrounds += 1 
        @total_funds += investment
    end 
    def num_funding_rounds(startup)
        self.all.select{|startup| startup.fundinground == startup}
    end 
end 




end





















end 
