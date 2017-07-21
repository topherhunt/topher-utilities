EXERCISES = {
  "Look far at distance for 2 mins" => 1,
  "Do blink exercises for 2 mins" => 1,
  "Face massage for 2 mins" => 1,
  "Do an eye exercise of your choice for 5 mins" => 0.5,

  "Do palming exercise for 15 mins" => 0.2,

  "Wrist exercises for 2 mins" => 1,
  "Do 10 pushups" => 1,
  "Balance for 2 mins" => 1,
  "Practice juggling for 5 mins" => 0.5,

  "Meditate for 2 mins" => 1,
  "Journal" => 1,

  # "Read / listen to / practice German for 15+ mins" => 0.2,
  "Meditate for 15 mins" => 0.1,
  "Go for a run. Really." => 0.1,
  "Do yoga for 20+ mins. Really." => 0.1,
  "Read a Zak article for 15+ mins. Really." => 0.1
}

def random_exercise
  EXERCISES.to_a.shuffle.each do |(text, weight)|
    return text if weight > rand
  end
end

def announce
  # alert_text = "Time to take a break! #{random_exercise}."
  alert_text = "Time to take a break!"
  # When this script is run in cron, it doesn't have access to the UI, so we
  # route through SystemUIServer. Thanks to stackoverflow.com/a/11874852/1729692
  `osascript -e 'try
    tell application "SystemUIServer"
    set answer to text returned of (display notification "#{alert_text}" with title "Mom")
    end
  end
  '`
end

def debug
  puts "Running random_exercise in verbose mode."
  puts "All exercise probabilities add up to #{EXERCISES.values.inject(0) { |a, b| a + b }.round(2)}. By comparison, this script will be invoked ~20 times on an average workday."
end

announce
