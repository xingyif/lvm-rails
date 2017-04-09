FactoryGirl.define do
  factory :tutor do
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    cell_phone { Faker::Base.numerify('(###) ###-####') }
    city { Faker::Address.city }
    country_of_birth { Faker::Address.country }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
    email_preferred { Faker::Internet.email }
    emergency_contact_email { Faker::Internet.email }
    emergency_contact_name { Faker::Name.name }
    emergency_contact_phone { Faker::Base.numerify('(###) ###-####') }
    hispanic_or_latino { [true, false].sample }
    first_name { Faker::Name.first_name }
    home_phone { Faker::Base.numerify('(###) ###-####') }
    language_proficiencies { TutorsHelper.language_proficiencies.to_json }
    last_name { Faker::Name.last_name }
    native_language { TutorsHelper.native_language.sample[0] }
    occupation { Faker::Company.profession }
    race { ApplicationHelper.race.sample[0] }
    smartt_id { Faker::Base.numerify('####-######') }
    state { ApplicationHelper.us_states.sample[0] }
    status { TutorsHelper.status_options.sample[0] }
    training_date { Faker::Date.between(10.years.ago, 1.day.ago) }
    training_type %w(ABE ESOL).sample
    zip { Faker::Base.numerify('#####') }
  end

  factory :employed_tutor, class: Tutor do
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    cell_phone { Faker::Base.numerify('(###) ###-####') }
    city { Faker::Address.city }
    country_of_birth { Faker::Address.country }
    date_of_birth { Faker::Date.between(80.years.ago, 18.years.ago) }
    email_preferred { Faker::Internet.email }
    emergency_contact_email { Faker::Internet.email }
    emergency_contact_name { Faker::Name.name }
    emergency_contact_phone { Faker::Base.numerify('(###) ###-####') }
    hispanic_or_latino { [true, false].sample }
    first_name { Faker::Name.first_name }
    home_phone { Faker::Base.numerify('(###) ###-####') }
    language_proficiencies { TutorsHelper.language_proficiencies.to_json }
    last_name { Faker::Name.last_name }
    native_language { TutorsHelper.native_language.sample[0] }
    occupation { Faker::Company.profession }
    race { ApplicationHelper.race.sample[0] }
    smartt_id { Faker::Base.numerify('####-######') }
    state { ApplicationHelper.us_states.sample[0] }
    status { TutorsHelper.status_options.sample[0] }
    training_date { Faker::Date.between(10.years.ago, 1.day.ago) }
    training_type %w(ABE ESOL).sample
    zip { Faker::Base.numerify('#####') }
    after(:create) do |tutor|
      affiliate = create(:affiliate)
      create(:volunteer_job, affiliate: affiliate, tutor: tutor)
    end
  end
end
