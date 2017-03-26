20.times do
  Tagging.seed do |t|
    t.tag_id = rand(20) + 1
    t.tutor_id = rand(20) + 1
  end
end

20.times do
  Tagging.seed do |t|
    t.tag_id = rand(20) + 1
    t.student_id = rand(20) + 1
  end
end
