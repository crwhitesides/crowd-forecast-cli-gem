class CrowdForecast::Park
  attr_accessor :name, :status

  def self.today
    disneyland = self.new
    disneyland.name = "Disneyland Park"
    disneyland.status = "Yup, it's packed"

    dca = self.new
    dca.name = "Disney California Adventure"
    dca.status = "Hey, it's alright"

    knotts = self.new
    knotts.name = "Knott's Berry Farm"
    knotts.status = "Ghost town"

    six_flags = self.new
    six_flags.name = "Six Flags"
    six_flags.status = "Ghost town"

    universal = self.new
    universal.name = "Universal Studios Hollywood"
    universal.status = "Hey, it's alright"

    sea_world = self.new
    sea_world.name = "Sea World"
    sea_world.status = "Hey, it's alright"

    legoland = self.new
    legoland.name = "Legoland"
    legoland.status = "Hey, it's alright"


    [disneyland, dca, knotts, six_flags, universal, sea_world, legoland]
  end

  def scrape_park_page
    park_urls = [
      "disneyland/", 
      "dca-disney-california-adventure/",
      "knotts-berry-farm/",
      "six-flags-magic-mountain/",
      "universal-studios-hollywood/",
      "seaworld-san-diego/",
      "legoland-california/"
    ]

  park_urls.each do |url|
    doc = Nokogiri::
  end

  end

end