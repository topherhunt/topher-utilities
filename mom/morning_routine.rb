{
  'open ~/Movies/Yoga' => 0,
  'say "Start with 12 minutes of yoga"' => 12,
  'say "Wrap up yoga and start back exercises for 3 minutes"' => 3.1,
  'say "Do wrist exercises for 1 minute"' => 1,
  'say "Now meditate for 2 minutes."' => 2,
  'say "Now its time for eye exercises!"' => 0.02,
  'say "Palm for 3 minutes"' => 3,
  'say "Blink for 1 minute"' => 1,
  'say "Look far at a distance for 2 minutes"' => 2,
  'say "Eye rotations for 1 minute"' => 1,
  'say "Room spin for 2 minutes"' => 2,
  'say "Look far at a distance again for 1 minute"' => 1,
  'say "Now prepare tea, vitamins, and a leafy breakfast"' => 2,
  %Q{osascript -e 'display alert "Thats your morning routine! Now clean our your inboxes, and youre ready to start your day."'} => 0
}.each do |(command, minutes)|
  puts command
  `#{command}`
  sleep minutes * 60
end
