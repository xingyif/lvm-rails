require 'application_helper'
require 'tutors_helper'

20.times do
  Tutor.seed do |t|
    t.address           = Faker::Address.street_address
    t.affiliate         = TutorsHelper.affiliate.sample[0]
    t.cell_phone        = Faker::Base.numerify('(###) ###-####')
    t.city              = Faker::Address.city
    t.dob               = Faker::Date.between(65.years.ago, 18.years.ago)
    t.education         = TutorsHelper.education.sample[0]
    t.email             = Faker::Internet.email
    t.employment        = TutorsHelper.employment.sample[0]
    t.first_name        = Faker::Name.first_name
    t.gender            = %w(Male Female).sample
    t.last_name         = Faker::Name.last_name
    t.native_language   = TutorsHelper.native_language.sample[0]
    t.occupation        = Faker::Company.profession
    t.orientation       = Faker::Date.between(1.month.ago, 1.week.ago)
    t.phone             = Faker::Base.numerify('(###) ###-####')
    t.race              = ApplicationHelper.race.sample[0]
    t.referral          = TutorsHelper.referral.sample[0]
    t.state             = Faker::Address.state
    t.training_type     = %w(ABE ESOL).sample
    t.training          = Faker::Date.between(1.month.ago, 1.week.ago)
    t.zip               = Faker::Base.numerify('#####')
  end
end
