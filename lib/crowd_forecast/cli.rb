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
    puts "            Five-Day Forecast            "
    print_5_day_forecast(park_number)
    puts ""
    puts ""
    print_calendar_notes(park_number)
    puts ""
  end

  def print_5_day_forecast(park_number) 
    if @parks[park_number-1].next_5_days.empty?
      puts "        Information not available.        "
    else
      @parks[park_number-1].next_5_days.each do |d|
        puts "       " + d + "       "
      end
    end
  end

  def print_calendar_notes(park_number)
    if @parks[park_number-1].calendar_notes == ""
      puts "There are no major calendar items to plan around."
    else
      puts "* Important Calendar Items To Keep In Mind *"
      puts ""
      puts "#{@parks[park_number-1].calendar_notes}"
    end
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
      puts ""
      puts ""

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