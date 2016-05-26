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

  def park_urls
    park_urls = {
        disneyland: "disneyland/", 
        dca: "dca-disney-california-adventure/",
        knotts: "knotts-berry-farm/",
        six_flags: "six-flags-magic-mountain/",
        universal: "universal-studios-hollywood/",
        sea_world: "seaworld-san-diego/",
        legoland: "legoland-california/"
    }
  end

  def doc(park_urls)
    doc = Nokogiri::HTML(open())
  end

  def self.scrape_park_page(url)

    doc = Nokogiri::HTML(open(url))
    name = doc.css('h1.page-title').text.gsub(' Crowd Tracker', '')
    status_options = doc.css('div.entry-content div a.button')
    current_status = ""
    5_day_forecast = []

    status_options.each do |status|
      if status.attr('style').include?("color:#fff")
        current_status = status.children.text
      end
    end
  end

end