class CrowdForecast::CLI

  def call
    start
  end

  def list_parks
    @parks = CrowdForecast::Park.today
    @parks.each.with_index(1) do |park, i|
      puts "#{i}. #{park.name} - #{park.current_status}"
    end
  end


   def print_park(park_number)
    puts "*------------* #{@parks[park_number-1].name} *------------*"
    puts ""
    print_5_day_forecast(park_number)
    puts""
    puts ""
    puts "#{@parks[park_number-1].calendar_notes}"
    puts ""
   end

   def print_5_day_forecast(park_number)  
    @parks[park_number-1].next_5_days.each do |d|
      header = "            Five-Day Forecast            "
      if d.length < 7
        header = "A 5-day forecast isn't available for this park."
        puts header
      else
        puts header
        puts "       " + d + "       "
      end
    end
   end

   def print_calendar_notes(park_number)

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
        print_park(input.to_i)
      when "2"
        print_park(input.to_i)
      when "3"
        print_park(input.to_i)
      when "4"
        print_park(input.to_i)
      when "5"
        print_park(input.to_i)
      when "6"
        print_park(input.to_i)
      when "7"
        print_park(input.to_i)
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