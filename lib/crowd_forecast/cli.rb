class CrowdForecast::CLI

  def run
    puts "Want to get away but worried about the crowds? Here are a few options (in California):"
    puts  ""
    list_parks
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
  end

  
end