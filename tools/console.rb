require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Apple", "Steve Jobs", "Tech Hardware")
s2 = Startup.new("Microsoft", "Bill Gates", "Software")
s3 = Startup.new("Zip2", "Elon Musk", "Software")

v1 = VentureCapitalist.new("Peter Thiel", 20000000)
v2 = VentureCapitalist.new("Mark Cuban", 2000000000)
v3 = VentureCapitalist.new("Kanye West", 1000000000)

# investment amount should be positive
f1 = FundingRound.new(s1, v1, "Angel", 1000)
f2 = FundingRound.new(s2, v2, "Seed", 2000)
f3 = FundingRound.new(s3, v1, "Series A", 3000)
f4 = FundingRound.new(s2, v1, "Series A", 4000)

s1.sign_contract(v2, "angel", 100)
s1.sign_contract(v1, "angel", 100)

v3.offer_contract(s3, "angel", 200)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line