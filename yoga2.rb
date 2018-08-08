# Yoga sequence reader!
# Usage: ruby yoga1.rb STEP=20
# (This lets you abort and continue from a specific step rather than needing to
#  restart from the beginning)

SEQUENCE = %{
  OK, let's do some yoga! 2

  # Seated breathing
  Sit cross-legged with your back straight. 2
  Close your eyes. Breathe in as deeply as you can. 4
  Then breathe out as fully as you can. 5
  Then in all the way again. 4
  Then out all the way again. 5
  In. 4
  And out. 5

  # Seated neck & arm stretch (each side x2)
    Now stretch your fingertips along the floor to each side. 3
  And gently tilt your head to the right. 15
  Now gently tilt your head to the left. 15
    Now tilt your head to the right again. 15
  Now tilt your head to the left again. 15

  # Seated twists (each side x2)
    Raise your arms straight up. Breathe in deeply. 3
  Breathe out and twist your torso and shoulders to the right. 10
    Then come back to center and breathe in. 2
  Breathe out and twist your torso and shoulders to the left. 10
    Then come back to center and breathe in. 2
  Breathe out and twist your torso and shoulders to the right. 10
    Then come back to center and breathe in. 2
  Breathe out and twist your torso and shoulders to the left. 10
    Then come back to center. 2

  # Alphabet & back stretch
    Stand up, with your hands together straight above you. 2
    Now trace the shape of each letter with your arms. 2
  A 2
  B 2
  C 2
  D 2
  E 2
  F 2
  G 2
  H 2
  I 2
  J 2
  Now stand on your left foot. 2
  K 2
  L 2
  M 2
  N 2
  O 2
  P 2
  Q 2
  R 2
  Now stand on your right foot. 2
  S 2
  T 2
  U 2
  V 2
  W 2
  X 2
  Y 2
  Z 4
  Now stand with hands clasped straight above you for a straight-backed bend. 3
  Gently hinge your hips forward, keeping your back straight. 20
  Good job, now come back to standing, and drop your arms. 3

  # Down dog / child's pose x5
    Lower yourself into plank position. 3
    Ensure your hands are right under your shoulders. 1
    Pull your heels back and the back of your head forward. 1
  Now hinge back to down dog. 15
    Hinge forward to plank. 1
    Put your knees to the floor. 1
  Then fold back into child's pose. 8
    Now up to hands and knees, then plank. 1
  Then pull back to downward facing dog. 15
    Now forward to plank. 1
  Knees to the ground, then back to child's pose. 5
    Plank. 1
  Down dog. 10
    Plank. 1
  Child's pose. 5
    Plank. 1
  Down dog. 8
    Plank. 1
  Child's pose. 5
  Up to plank. 1
  Down dog. 6
  Now let's go faster. 1
    Plank. 1
  Child's pose. 2
    Plank. 1
  Down dog. 3
    Plank. 1
  Child's pose. 2
    Plank. 1
  Down dog. 3
    Plank. 1
  Child's pose. 2
    Plank. 1
  Down dog. 3
    Plank. 1
  Child's pose. 2
    Plank. 1
  Down dog. 3
    Plank. 1
  Child's pose. 2
    Plank. 1
  Down dog. 3
    Plank. 1
  Child's pose. 2
    Plank. 1
  Down dog. 3
  Good job. 1

  # Cat / cow x5
    Get onto hands and knees for cat cow. 2
    Breathe in. 1
  Arch up into cat. 6
  Round down into cow. 6
  Cat. 4
  Cow. 4
  Cat. 3
  Cow. 3
  Cat. 3
  Cow. 3
  Cat. 3
  Cow. 3
  Come back to straight back. 1

  # TODO: At some point I'll add a couple vinyasas in here, from my old routine. 3

  # Push-ups
  Get into position for forty push-ups. 10
  First set of ten. 20
  Rest for a few seconds. 5
  Next set of ten. 20
  Rest for a few seconds. 5
  Third set of ten. 20
  Rest for a few seconds. 5
  Final set of ten. 20
  Rest for a few seconds. 5
  Nice job! 1

  # Standing arm rotations & stretches
    Stand on your mat in an open space, with your feet shoulder-distance apart. 3
  Keeping your legs rooted, swing your torso, shoulders, and arms from side to side at your own pace. 40
    Now come back to stillness. 3
  Rotate your right arm backward in large but gentle circles. 10
    Now make the circles as large and straight as you can. 10
    Come back to stillness. 2
  Rotate your left arm backward in large but gentle circles. 10
    Now make the circles as large and straight as you can. 10
    Come back to stillness. 2
  Rotate your right arm forward in large but gentle circles. 10
    Now make the circles as large and straight as you can. 10
    Come back to stillness. 2
  Rotate your left arm forward in large but gentle circles. 10
    Now make the circles as large and straight as you can. 10
    Come back to stillness. 2
  Now reach your arms straight up and clasp your fingers, with your palms facing up. 3
  Breathe in deeply. 1
  Now breathe out and side-bend to the left. 4
    Come back to center and breathe in. 1
  Breathe out and side-bend to the right. 4
    Come back to center and release your arms down by your side. 2
    Now clasp your hands behind your back, with arms straight. 3
  Slowly hinge your hips forward. 5
    Breathe deeply. 5
    And stretch your clasped arms further forward above you. 15
    Then slowly let go of your hands and come back to standing. 4

  # Squat stretches
    Squat on your mat with your feet shoulder-width apart. 3
  Twist your torso to the left and reach your left arm straight up. 5
    Breathe deeply. 10
    Lower your left arm. 2
  Twist your torso to the right and reach your right arm straight up. 5
    Breathe deeply. 10
    Lower your arm and come back to center. 1
  Twist your torso to the left and reach your left arm straight up. 10
    Lower your arm and come back to center. 1
  Twist your torso to the right and reach your right arm straight up. 10
    Lower your arm and come back to center. 1

  # Hamstring stretch
  Sit on your mat, with your left leg out straight, for a hamstring stretch. 3
    Pull your back up straight and breathe in. 1
  Breathe out and twist your torso and shoulders to the right. 12
    Now come back to center. 1
    Reach your arms straight overhead and breathe in. 1
  Breathe out and reach your arms towards your outstretched leg. 25
    Now gently come back upright. 5
    Switch your legs so your right leg is out straight. 2
    Pull your back up straight and breathe in. 1
  Breathe out and twist your torso and shoulders to the left. 12
    Now come back to center. 1
    Reach your arms straight overhead and breathe in. 1
  Breathe out and reach your arms towards your outstretched leg. 25
    Gently come back upright. 2

  # Cross-legged yin stretch forward
  Sit cross-legged. 3
  Lift your arms in front and straight up above you, and breathe in deeply. 2
  Now breathe out as you slowly hinge forward, reaching your arms to the floor in front of you. 5
  Let yourself sink forward and relax. Keep breathing. 20
  Now gently push yourself back up to a straight back. 5

  # Leg / hip stretches lying on floor
  Lie on your mat on your back. 3
  Pull your left knee to your chest. Stretch your right leg and foot out straight. 15
    Now gently let go of your left leg and lie with both legs straight. 5
  Pull your right knee to your chest. Stretch your left leg and foot out straight. 15
    Gently let go of your right leg and lie with both legs straight. 5

  You're done! Thank you for taking the time for this yoga routine. 1
}

def raise_error(msg)
  `say "There was an error. This session will now stop."`
  raise msg
end

start_time = Time.now
start_at_step = ARGV[0].to_i # defaults to 0
current_step = 0
total_duration = 0

SEQUENCE.split("\n").each do |line|
  line = line.strip
  next if line == ""
  words = line.split(" ")
  next if words.first == "#"
  command = words[0..-2].join(" ")
  duration = words.last.to_i
  raise_error "Can't parse line: '#{line}'" if duration == 0

  current_step += 1
  puts "#{current_step}: #{command} (#{duration} secs)"
  next if current_step < start_at_step
  `say "#{command}"`
  sleep duration
  total_duration += duration
end

duration_mins = ((Time.now - start_time) / 60.0).round(1)
puts "Done! This session lasted #{duration_mins} minutes over #{current_step} steps."
