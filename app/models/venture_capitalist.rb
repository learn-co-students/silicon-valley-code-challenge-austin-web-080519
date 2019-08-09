require "pry"
require_relative "funding_round"
class VentureCapitalist
  attr_reader :name, :total_worth
  @@all = []
  def initialize(name, total_worth)
    @name = name
    total_worth = 0 if total_worth < 0
    @total_worth = total_worth.to_f
    @@all << self
  end

  def self.all
    @@all
  end

  def total_worth=(total_worth)
    total_worth = 0 if total_worth < 0
    @total_worth = total_worth.to_f
  end


  def self.tres_commas_club
    @@all.select{|capitalist| capitalist.total_worth > 1000000000}
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select{|round| round.venture_capitalist == self}
  end

  def portfolio
    self.funding_rounds.collect{|round| round.startup}.uniq
  end

  def biggest_investment
    self.funding_rounds.max {|round1, round2| round1.investment <=> round2.investment}
  end

  def invested(domain)
    total = self.funding_rounds.select{|round| round.startup.domain == domain}.collect{|round| round.investment}.inject{|sum, n| sum + n}
    total ||= 0
  end


end
