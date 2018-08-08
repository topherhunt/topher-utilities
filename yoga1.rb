# Yoga sequence reader!
# Usage: ruby yoga1.rb STEP=20
# (This lets you abort and continue from a specific step rather than needing to
#  restart from the beginning)

SEQUENCE = %{
  OK, let's do some yoga! 2

  # Seated breathing
  Sit cross-legged with your back straight. 2
  Close your eyes. Breathe in as deeply as you can. 5
  Then breathe out as fully as you can. 7
  Then in all the way again. 5
  Then out all the way again. 7
  In. 5
  Out. 7
  In. 5
  Out. 7
  One more time, in. 5
  And out. 7

  # Seated neck & arm stretch (each side x2)
    Now stretch your fingertips along the floor to each side. 3
  And gently tilt your head to the right. 15
  Now gently tilt your head to the left. 15
    Now tilt your head to the right again. 1
    And gently rest your right hand, on the side of your head, to add a bit of pressure. 15
  Now tilt your head to the left again. 1
    And gently rest your left hand, on the side of your head. 15
    Lower your arms, and rest your hands on your knees. Breathe deeply. 3

  # Seated twists (each side x2)
    Raise your arms straight up. Breathe in deeply. 5
  Slowly pivot your torso and shoulders around your spine to the right. Breathe out. 5
    Breathe in deeply again. 3
    And use the out-breath to find a bit more twist to the right. 5
    Then back to center, still keeping your arms straight up. 2
    Breathe in deeply. 3
  Slowly pivot your torso and shoulders around your spine to the left. Breathe out. 5
    Breathe in deeply again. 3
    And use the out-breath to find a bit more twist to the left. 5
    Then back to center, still keeping your arms straight up. 2
  Slowly pivot your torso and shoulders around your spine to the right. Breathe out. 5
    Breathe in deeply again. 3
    And use the out-breath to find a bit more twist to the right. 5
    Then back to center, still keeping your arms straight up. 2
    Breathe in deeply. 3
  Slowly pivot your torso and shoulders around your spine to the left. Breathe out. 5
    Breathe in deeply again. 3
    And use the out-breath to find a bit more twist to the left. 5
  Then back to center and lower your arms. 3

  # Alphabet & back stretch
    Stand up, with your hands together straight above you. 5
    Now trace the shape of each letter with your arms. 2
  A 3
  B 3
  C 3
  D 3
  E 3
  F 3
  G 3
  H 3
  I 3
  J 3
  Now stand on your left foot. 2
  K 3
  L 3
  M 3
  N 3
  O 3
  P 3
  Q 3
  R 3
  Now stand on your right foot. 2
  S 3
  T 3
  U 3
  V 3
  W 3
  X 3
  Y 3
  Z 5
  Now stand, with your hands in prayer position, and arms straight above you. 2
  Your knees should be slightly bent. 2
  Very slowly, hinge your hips to bend forward. 2
  Your back should stay perfectly straight; only your hips have moved. 2
  Keep your arms reaching out, above your head, in a straight line from your hips. 2
  Stay in this bend for a few deep breaths. 20
  Good job, now come back to standing, and lower your arms. 5

  # Down dog / child's pose x5
    Lower yourself into plank position. 3
    Ensure your hands are right under your shoulders. 1
    Pull your heels back and the back of your head forward. 1
    Feel the straightness of your body. 2
  Now hinge back into downward-facing dog. 5
    Alternately step your feet to the ground to help climb into the posture. 10
    Breathe deep and stretch your hips up and back as far as you can. 15
    Now hinge forward into a straight plank. 3
    Put your knees to the floor. 2
  Then hinge back into child's pose. 3
    Stretch your arms straight forward, 2
    and breathe deeply in and out. 8
    Now back up to hands and knees. 1
    Then plank. 2
  Then pull back to downward facing dog. 5
    Breathe deeply and stretch your hips up and back. 8
    Try to flatten your feet with your heels on the ground. 15
    Now forward to plank. 2
    Knees to the ground. 1
  And back to child's pose. 10
    Up to plank 3
  And back to down dog. 12
    Rock forward to plank. 3
  Then child's pose. 8
  Up to plank. 1
  Down dog. 10
  Forward to plank. 1
  Child's pose. 8
  Up to plank. 1
  Down dog. 10
  Forward to plank. 1
  Child's pose. 8
  Now let's go a bit faster. 2

  Plank, and down dog. 5
  Plank, and child's pose. 4
  Plank, and down dog. 5
  Plank, and child's pose. 4
  Plank, and down dog. 5
  Plank, and child's pose. 4
  Plank, and down dog. 5
  Plank, and child's pose. 4
  Plank, and down dog. 5
  Plank, and child's pose. 4
  Good job. 1

  # Cat / cow x5
    Lift up onto your hands and knees, with your hands directly under your shoulders. 1
    Breathe in deeply. 2
  Arch your spine up like a cat, as high and rounded as you can, and breathe out. 2
  Then sink your spine down into a rounded U shape and breathe in. 7
  Arch up in cat. 7
  And down to cow. 7
  Arch up to cat. 5
   And down to cow. 5
  Cat. 5
  Cow. 5
  Cat. 5
  Cow. 5
  Come back to straight back. 3

  TODO: At some point I'll add a couple vinyasas in here, from my old routine. 3

  # Push-ups
  Stand up and get into position for forty push-ups, at whatever angle. 10
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Thirty left. Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Twenty to go! Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Ten more! Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Down. 2
  Up. 2
  Nice job! Come back to your mat. 3

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
  Now reach your arms straight up and clasp your fingers, with your palms facing up. 2
  Breathe in deeply. 3
  Now side-bend to the left, breathing out as you do so. 10
    Come back to center and breathe in deeply. 3
  Side-bend to the right and breathe out. 10
    Come back to center. 2
    Switch the clasp of your hands. 2
    Now breathe in deeply. 2
  Side-bend to the left and breathe out. 10
    Come back to center and breathe in deeply. 3
  Side-bend to the right and breathe out. 10
    Come back to center and release your arms down by your side. 5
    Now clasp your hands behind your back, with arms straight. 3
  Slowly hinge your hips forward. 5
    Breathe deeply. 5
    And stretch your clasped arms further forward above you. 15
    Then slowly let go of your hands and come back to standing. 5

  # Squat stretches
    Squat on your mat with your feet shoulder-width apart and angled out. 3
    Rest your arms on the mat in front of you. 2
  Allow your torso and head to fall forward into a back and hip stretch. 3
    Breathe deeply. 12
    Now lift your head and back up. 1
  Twist your upper body to the left and reach your left arm straight up to the ceiling. 5
    Breathe deeply. 10
    Lower your left arm. 2
  Twist your upper body to the right and reach your right arm straight up to the ceiling. 5
    Breathe deeply. 10
    Lower your right arm. 2
  Twist your upper body to the left and reach your left arm straight up to the ceiling. 5
    Breathe deeply. 10
    Lower your left arm. 2
  Twist your upper body to the right and reach your right arm straight up to the ceiling. 5
    Breathe deeply. 10
    Lower your right arm. 2

  # Hamstring stretch
  Sit on your mat with, your left leg out straight, for a hamstring stretch. 3
  Breathe in and pull your back up straight. 3
  Then breathe out and twist your torso and shoulders to the right. 15
  Now come back to center. 1
  Breathe in and reach your arms straight overhead. 3
  Breathe out and reach your arms towards your outstretched leg. 5
  Breathe deeply and relax into the stretch. 30
  Now gently come back to straight back. 5
  Switch your legs so your right leg is out straight. 3
  Breathe in and pull your back up straight. 3
  Then breathe out and twist your torso and shoulders to the left. 15
  Now come back to center. 1
  Breathe in and reach your arms straight overhead. 3
  Breathe out and reach your arms towards your outstretched leg. 5
  Breathe deeply and relax into the stretch. 30

  # Cross-legged yin stretch forward
  Sit cross-legged. 5
  Lift your arms in front and straight up above you, and breathe in deeply. 5
  Now breathe out as you slowly hinge forward, reaching your arms to the floor in front of you. 5
  Let yourself sink forward and relax. Keep breathing. 20
  Now gently push yourself back up to a straight back. 5

  # Leg / hip stretches lying on floor
  Lie on your mat on your back. 3
  Pull your left knee to your chest. Stretch your right leg and foot out straight. 15
    Now gently let go of your left leg and lie with both legs straight. 3
  Pull your right knee to your chest. Stretch your left leg and foot out straight. 15
    Gently let go of your right leg and lie with both legs straight. 3
  Pull your left knee to your chest. Stretch your right leg and foot out straight. 15
    Gently let go of your left leg and lie with both legs straight. 3
  Pull your right knee to your chest. Stretch your left leg and foot out straight. 15
    Gently let go of your right leg and lie with both legs straight. 3

  You're done! 1
  Thank you for taking the time for this yoga routine. 2
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
