class CrowdForecast::Park
  attr_accessor :name, :current_status, :next_5_days, :calendar_notes

  def initialize(name = nil, current_status = nil, next_5_days = nil, calendar_notes = nil)
    @name = name
    @current_status = current_status
    @next_5_days = next_5_days
    @calendar_notes = calendar_notes
  end

  def self.all
    @@all ||= CrowdForecast::Scraper.scrape_parks
  end

  def self.find(id)
    self.all[id-1]
  end
end