require_relative "Funding round"
class Startup
    attr_reader :name, :founder, :domain

    @@all = []
    def initialize(name, founder, domain)
        @name = name 
        @founder = founder 
        @domain = domain 
        @@all << self 
    end 
    def pivot(name, domain)
        @name = name 
        @domain = domain
    end 
    def self.all
        @all
    end 
    def self.find_by_founder(founder)
        self.all.find{|startup| startup.founder == founder}
    end 
    end
    def self.domains(domain) 
        self.all.collect{|startup| startup.domain}
    end 
    end 
    def sign_contract(type, investment, venture_capitalist)
        Fundinground.new = fundinground(self, venture_capitalist, type, investment)
    end 





end





















end 
