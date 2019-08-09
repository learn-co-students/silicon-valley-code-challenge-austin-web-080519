require_relative "funding_round"
class Startup
  attr_reader :name, :founder, :domain
  @@all = []
  def initialize(name, founder, domain="#{name.gsub(/\s/, "").downcase}.com")
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end
  def pivot(name, domain="#{name.gsub(/\s/, "").downcase}.com")
    @name = name
    @domain = domain
    self
  end
  def self.all
    @@all
  end
  def self.find_by_founder(name)
    @@all.find{|startup| startup.founder == name}
  end
  def self.domains
    @@all.collect{|startup| startup.domain}
  end

  def sign_contract(ven_cap, type, investment)
    FundingRound.new(self, ven_cap, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select{|round| round.startup == self}.length
  end

  def total_funds
    FundingRound.all.select{|round| round.startup == self}.collect{|round| round.investment}.inject{|sum, n| sum + n}
  end

  def investors
    FundingRound.all.select{|round| round.startup == self}.collect{|round| round.venture_capitalist}.uniq
  end

  def big_investors
    self.investors.select{|capitalist| capitalist.total_worth > 1000000000}
  end




end

