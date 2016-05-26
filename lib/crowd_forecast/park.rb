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

  def self.scrape_park_page
    # park_urls = [
    #   "disneyland/", 
    #   "dca-disney-california-adventure/",
    #   "knotts-berry-farm/",
    #   "six-flags-magic-mountain/",
    #   "universal-studios-hollywood/",
    #   "seaworld-san-diego/",
    #   "legoland-california/"
    # ]

    # name = doc.css('h1.page-title').text.gsub(' Crowd Tracker', '')
    # status_text_color = doc.css('div.entry-content div a.button')[0].attr('style').include?("color:#fff")
    # status = doc.css('div.entry-content div a.button').children.text

    doc = Nokogiri::HTML(open("http://www.isitpacked.com/live-crowd-trackers/disneyland/"))
    name = doc.css('h1.page-title').text.gsub(' Crowd Tracker', '')
    status_options = doc.css('div.entry-content div a.button')
    current_status = ""

    status_options.map do |status|
      if status.attr('style').include?("color:#fff")
        current_status = status.children.text
      end
    end
    binding.pry

  end

end