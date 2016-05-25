class CrowdForecast::Park
  attr_accessor :name, :status

  def self.today
    puts <<-DOC.gsub /^\s+/, ""
    1. Disneyland Park - Yup, it's packed
    2. Disney California Adventure - Hey, it's alright
    3. Knott's Berry Farm - Ghost town
    4. Six Flags - Ghost town
    5. Universal Studios Hollywood - Hey, it's alright
    6. Sea World - Hey, it's alright
    7. Legoland - Hey, it's alright
    DOC

    disneyland = self.new
    disneyland.name = "Disneyland Park"
    disneyland.status = "Yup, it's packed"

    dca = self.new
    dca.name = "Disney California Adventure"
    dca.status = "Hey, it's alright"

    [disneyland, dca]
  end

  def doc

  end
end