require 'pry'

def get_first_name_of_season_winner(data, season)
  winner = nil
  data[season].each do |contestants|
    if contestants["status"] == "Winner"
      winner = contestants["name"].split[0]
    end
  end
  winner
end

def get_contestant_name(data, occupation)
  name = nil
  data.each do |seasons|
    seasons.each do |contestants|
      if contestants.class != String
        contestants.each do |att|
          if att["occupation"] == occupation
            name = att["name"]
          end
        end
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |seasons|
    seasons.each do |contestants|
      if contestants.class != String
        contestants.each do |att|
          if att["hometown"] == hometown
            count += 1
          end
        end
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  occ = 0
  data.each do |seasons|
    seasons.each do |contestants|
      if contestants.class != String
        contestants.each do |att|
          if att["hometown"] == hometown
            occ = att["occupation"]
            return occ
          end
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  (data[season].map do |person|
    person["age"]
  end.reduce(0) do |sum, age|
    # binding.pry
    sum + age.to_f
  end / data[season].length).round
end