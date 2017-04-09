require 'application_helper'
require 'tutors_helper'

100.times do
  Tutor.seed do |t|
    t.address1                = Faker::Address.street_address
    t.address2                = Faker::Address.secondary_address
    t.cell_phone              = Faker::Base.numerify('(###) ###-####')
    t.city                    = Faker::Address.city
    t.country_of_birth        = Faker::Address.country
    t.date_of_birth           = Faker::Date.between(80.years.ago, 18.years.ago)
    t.email_preferred         = Faker::Internet.email
    t.emergency_contact_email = Faker::Internet.email
    t.emergency_contact_name  = Faker::Name.name
    t.emergency_contact_phone = Faker::Base.numerify('(###) ###-####')
    t.first_name              = Faker::Name.first_name
    t.hispanic_or_latino      = [true, false].sample
    t.home_phone              = Faker::Base.numerify('(###) ###-####')
    t.language_proficiencies  = TutorsHelper.language_proficiencies.to_json
    t.last_name               = Faker::Name.last_name
    t.native_language         = TutorsHelper.native_language.sample[0]
    t.occupation              = Faker::Company.profession
    t.race                    = ApplicationHelper.race.sample[0]
    t.smartt_id               = Faker::Base.numerify('####-######')
    t.state                   = ApplicationHelper.us_states.sample[0]
    t.status                  = TutorsHelper.status_options.sample[0]
    t.zip                     = Faker::Base.numerify('#####')
  end
end
