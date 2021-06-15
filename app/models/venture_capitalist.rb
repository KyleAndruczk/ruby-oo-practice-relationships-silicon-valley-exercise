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
        self.all.select { |capitalist| capitalist.total_worth >= 1000000000 }
    end

    def offer_contract(startup, investment_type, investment_amount)
        FundingRound.new(startup, self, investment_type, investment_amount)
    end

    def funding_rounds
        FundingRound.all.select { |funding| funding.venture_capitalist == self }
    end

    def portfolio
        self.funding_rounds.map { |funding| funding.startup }.uniq
    end

    def biggest_investment
        self.funding_rounds.map { |funding| funding.investment}.max
    end

    def invested(domain)
        investments_in_domain = self.funding_rounds.select { |funding| funding.startup.domain == domain}
        investments_in_domain.reduce(0) { |sum, funding| sum + funding.investment }
    end

end
