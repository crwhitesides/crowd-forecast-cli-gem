class CrowdForecast::CLI

  def run
    start
  end

  def list_parks
    @parks = CrowdForecast::Park.today
  end

  def start
    puts "How packed are the parks today? Let's see:"
    puts  ""
    list_parks
    puts "" 
    
    input = ""

    while input != "exit"
      puts "Enter 1-7 to look at the 5-day forecast of a park." unless input == "exit"
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
        other_result = <<-DOC.gsub /^\s+/, ""
        That's not a valid request.
        For a full list of parks enter "list"
        To exit, just enter "exit"
        DOC
        puts other_result unless input == "list" || input == "exit"
      end
    end
    puts "See you soon!"
  end


end