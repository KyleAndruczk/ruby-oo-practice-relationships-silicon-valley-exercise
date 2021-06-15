class Startup

    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @name = name 
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find { |startup| startup.founder == founder}
    end

    def self.domains
        self.all.map { |startup| startup.domain}.uniq
    end

    def sign_contract(capitalist, investment_type, investment_amount)
        FundingRound.new(self, capitalist, investment_type, investment_amount)
    end

    def num_funding_rounds
        self.fundings.count
    end

    def total_funds
        self.fundings.reduce(0) { |sum, funding| sum + funding.investment }
    end

    def investors
        self.fundings.map { |funding| funding.venture_capitalist }.uniq
    end

    def big_investors
        self.investors.select { |capitalist| capitalist.total_worth >= 1000000000}
    end


    #helper method
    def fundings 
        FundingRound.all.select { |funding| funding.startup == self }
    end


end
