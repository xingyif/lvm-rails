# The file is prefixed with 'z_' so it will be alphabetically last and seed last
# Since taggings have tag_id, student_id, and tutor_id it must be seeded after
# those models or a Postgres will throw ForeignKeyViolation errors and seeding
# will stop.

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
