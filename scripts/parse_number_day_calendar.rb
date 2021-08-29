require "set"

ht = {}

def good_date?(s)
  s.match(/\A202[0-9]-[01][0-9]-[0123][0-9]\Z/)
end

def good_number_day?(s)
  good_numberdays = Set.new %w[1 2 3 4]

  good_numberdays.include? s
end

def good_previous_number_day?(current, previous)
  correct_previous = {
    "1" => "4",
    "2" => "1",
    "3" => "2",
    "4" => "3",
  }

  correct_previous[current] == previous
end

def printable_number_day(s)
  case s
  when "1"
    "One"
  when "2"
    "Two"
  when "3"
    "Three"
  when "4"
    "Four"
  else
    raise ArgumentError.new("must be '1', '2', '3', or '4'")
  end
end


previous_number_day = nil

File.open(ARGV.first).each_line.with_index do |line, idx|
  line.chomp!

  if idx.zero?
    unless line == "Date\tNumberDay"
      abort "ERROR -- bad header: #{line.inspect}"
    end
  else
    date, number_day = line.chomp.split "\t"

    unless good_date? date
      abort "ERROR -- bad format for: #{date}"
    end

    if ht.has_key? date
      abort "ERROR -- #{date} is repeated in #{ARGV.first}"
    end

    unless good_number_day? number_day
      abort "ERROR -- bad number_day for: #{number_day}"
    end

    unless previous_number_day.nil? || good_previous_number_day?(current, previous)
      abort "ERROR -- bad previous number day for #{line.inspect}.  " \
            "Current number_day: #{number_day}.  Previous: #{previous_number_day}."
    end

    ht[date] = number_day
  end
end

ht.each_with_index do |(date, number_day), idx|
  number_day = printable_number_day(number_day)

  if idx.zero?
    puts %Q|[ ("#{date}", #{number_day})|
  else
    puts %Q|, ("#{date}", #{number_day})|
  end
end
puts "]"
