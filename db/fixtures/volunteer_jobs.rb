tutors = [*1..100].shuffle
affiliates = [*1..5].shuffle

100.times do
  VolunteerJob.seed do |v|
    v.tutor_id = tutors.pop
    v.affiliate_id = affiliates.sample
    v.start = Date.today
  end
end
