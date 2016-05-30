class CrowdForecast::Park
  attr_accessor :name, :current_status, :next_5_days, :calendar_notes

  def self.today
    self.scrape_parks
  end


  def self.scrape_parks
    park_urls = [
    "disneyland/", 
    "dca-disney-california-adventure/",
    "knotts-berry-farm/",
    "six-flags-magic-mountain/",
    "universal-studios-hollywood/",
    "seaworld-san-diego/",
    "legoland-california/"
    ]

    instances = park_urls.map do |slug|
      doc = Nokogiri::HTML(open("http://www.isitpacked.com/live-crowd-trackers/" + slug))

      park = self.new
      park.name = doc.css('h1.page-title').text.gsub(' Crowd Tracker', '')
      park.current_status = ""
      park.next_5_days = self.scrape_5_day_forecast(slug)
      park.calendar_notes = self.scrape_calendar_notes(slug)

      status_options = doc.css('div.entry-content div a.button')
      status_options.each do |status|
        if status.attr('style').include?("color:#fff")
          park.current_status = status.children.text
        end
      end
      park
    end
    instances
  end

  def self.scrape_5_day_forecast(slug)
    doc = Nokogiri::HTML(open("http://www.isitpacked.com/live-crowd-trackers/" + slug))

    crowd_forecast_list = doc.css('.supe-item-holder div.rhc-widget-upcoming-item')

    next_5_days = crowd_forecast_list.map.with_index do |day, i|
      month = crowd_forecast_list[i].css('.rhc-date-month-year').text
      day = crowd_forecast_list[i].css('.rhc-date-day').text
      status = crowd_forecast_list[i].css('.rhc-widget-upcoming-title a').text
      "#{month} #{day} -.- #{status}"
    end
    next_5_days
  end


  def self.scrape_calendar_notes(slug)
    if slug == "disneyland/" || slug == "dca-disney-california-adventure/"
      doc = Nokogiri::HTML(open("http://www.isitpacked.com/disneyland-crowd-forecast-predictor-calendar/"))
    else
      doc = Nokogiri::HTML(open("http://www.isitpacked.com/crowd-calendars/" + slug))
    end
    doc.css('div#aone p').text.gsub(/For real.+Tracker./, "")
  end

end