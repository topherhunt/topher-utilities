{
  "Palm" => 5,
  "Look far at a distance" => 1,
  "Eye rotations" => 1,
  "Room spin" => 2,
  "Blink" => 1,
  "Look far at a distance again" => 1
}.each do |text, minutes|
  `say "#{text} for #{minutes} minutes"`
  sleep 60 * minutes
end
