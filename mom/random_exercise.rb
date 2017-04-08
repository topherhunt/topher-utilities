EXERCISES = {
  "Look far at distance for 2 mins" => 1,
  "Do blink exercises for 2 mins" => 1,
  "Wrist exercises for 2 mins" => 1,
  "Do 10 pushups" => 1,
  "Balance for 2 mins" => 1,
  "Meditate for 2 mins" => 1,
  "Journal" => 1,
  "Do an eye exercise of your choice for 5 mins" => 0.5,
  "Practice juggling for 5 mins" => 0.5,
  "Do palming exercise for 15 mins" => 0.2,
  "Read / listen to / practice German for 15+ mins" => 0.2,
  "Meditate for 15 mins" => 0.1,
  "Go for a run" => 0.1,
  "Do yoga for 20+ mins" => 0.1,
  "Read a Zak article for 15+ mins" => 0.1
}

def random_exercise
  EXERCISES.to_a.shuffle.each do |(text, weight)|
    return text if weight > rand
  end
end

`osascript -e 'display alert "Time to take a break! #{random_exercise}."'`
