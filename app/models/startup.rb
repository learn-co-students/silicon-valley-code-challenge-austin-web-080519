require_relative 'venture_capitalist'
require_relative 'funding_round'

class Startup
attr_reader :founder, :domain, :name 
attr_accessor :fund

@@all = []

        def initialize(name, founder, domain, fund = 0)
            @name = name
            @founder = founder
            @domain = domain
            @fund = fund
            @@all << self
        end
        
        # method that returns all the startup instances
        def self.all
            @@all
        end
        


        #given a string of a domain and a string of a name, change the domain and name of the startup
        def pivot(new_domain, new_name)
            @domain = new_domain
            @name = new_name
         end

        #given a string of a founder's name, returns the first startup whose founder's name matches
        def self.find_by_founder(founder_name)
            self.all.find{|startup| startup.founder == founder_name}            
        end
        #should return an arrays of all the different startup domains 
        def self.domains
            self.all.collect{|startup| startup.domain}
        end
        
        def sign_contract(invest, amount, vc)
            new_round = FundRounding.new(self, vc, investment, type)
        end

        # needs to count the couple of times startup has been funded!
        def funding_rounds
            funding_round.all.select {|round| round.startup == self}
        end

        def num_funding_rounds
            self.funding_round.length
        end
        
        
