class CrowdForecast::CLI

  def run
    start
  end

  def list_parks
    puts <<-DOC.gsub /^\s+/, ""
    1. Disneyland Park - Yup, it's packed
    2. Disney California Adventure - Hey, it's alright
    3. Knott's Berry Farm - Ghost town
    4. Six Flags - Ghost town
    5. Universal Studios Hollywood - Hey, it's alright
    6. Sea World - Hey, it's alright
    7. Legoland - Hey, it's alright
    DOC

    # @parks = CrowdForecast::Park.today
  end

  def start
    puts "How packed are the parks today? Let's see:"
    puts  ""
    list_parks
    puts "" 
    
    input = ""

    while input != "exit"
      puts "Select a park to look at the forecast for the next five days." unless input == "exit"
      input = gets.strip.downcase

      case input
      when "1"
        puts "Disneland 5-day forecast"
      when "2"
        puts "DCA 5-day forecast"
      when "3"
        puts "Knott's 5-day forecast"
      when "4"
        puts "Six Flag's 5-day forecast"
      when "5"
        puts "Universal's 5-day forecast"
      when "6"
        puts "Sea World's 5-day forecast"
      when "7"
        puts "Legoland's 5-day forecast"
      when "list"
        list_parks
      else
        puts <<-DOC.gsub /^\s+/, ""
        That's not a valid request.
        For a full list of parks enter "list"
        To exit, just enter "exit"
        DOC
      end
    end
    puts "See you soon!"
  end


end