class CrowdForecast::CLI

  def call
    start
  end

  def list_parks
    CrowdForecast::Park.all.each.with_index(1) do |park, i|
      puts "#{i}. #{park.name} - #{park.current_status}"
    end
  end

  def print_5_day_forecast(park)
    if park.next_5_days.empty?
      puts "        Information not available.        "
    else
      park.next_5_days.each do |d|
        puts "       " + d + "       "
      end
    end
  end

  def print_calendar_notes(park)
    if park.calendar_notes == ""
      puts "There are no major calendar items to plan around."
    else
      puts "* Important Calendar Items To Keep In Mind *"
      puts ""
      puts "#{park.calendar_notes}"
    end
  end

  def print_park(park)
    puts "*------------* #{park.name} *------------*"
    puts ""
    puts "            Five-Day Forecast            "
    print_5_day_forecast(park)
    puts ""
    puts ""
    print_calendar_notes(park)
    puts ""
  end



  def start
    puts "How packed are the parks today? Let's see:"
    puts  ""
    list_parks
    
    input = nil

    while input != "exit"
      puts "Enter 1-7 to look at the 5-day forecast of a park." 
      input = gets.strip.downcase
      puts ""

      park = CrowdForecast::Park.find(input.to_i)

      if (1..7).include?(input.to_i)
        print_park(park)
      elsif input == "list"
        list_parks
      else
        other_result = <<-DOC.gsub /^\s+/, ""
        For a full list of parks enter "list".
        To exit the program enter "exit".
        DOC
        puts other_result unless input == "list" || input == "exit"
      end
    end
    puts "See you soon!"
  end


end