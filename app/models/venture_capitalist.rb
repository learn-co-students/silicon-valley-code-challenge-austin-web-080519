class VentureCapitalist
attr_reader :name, :total_worth
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
    self.all.collect {|record| record.total_worth > 1000000}
#grabs all the venture capitalists whose total_worth is worth more than 1000000
end
end 
end 
