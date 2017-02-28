require 'rails_helper'

RSpec.describe 'tutors/index', type: :view do
  before(:each) do
    assign(:tutors,
           [Tutor.create!(first_name: 'Y',
                          last_name: 'X',
                          gender: 'male',
                          address1: '1',
                          address2: 'Address',
                          city: 'city',
                          state: 'state',
                          zip: '02222',
                          country_of_birth: 'cob',
                          date_of_birth: '1994-02-11',
                          emergency_contact_name: 'ecn',
                          emergency_contact_phone: 'ecp',
                          emergency_contact_email: 'ece',
                          language_proficiencies: 'lp',
                          race: 'rr',
                          smartt_id: '8888-888888',
                          hispanic_or_latino: true,
                          home_phone: '601-000-0000',
                          cell_phone: '602-000-0000',
                          email_preferred: 'Email@1.com',
                          email_other: 'Email@2.com',
                          native_language: 'English',
                          orientation_date: 'o',
                          training_date: 'td',
                          training_type: 'ty',
                          referral: 'r',
                          education: 'e',
                          employment_status: 'es',
                          occupation: 'oc')])
  end

  it 'renders a list of tutors' do
    render
    expect(rendered).to match(/Y/)
    expect(rendered).to match(/X/)
    expect(rendered).to match(/601-000-0000/)
    expect(rendered).to match(/602-000-0000/)
    expect(rendered).to match(/Email@1.com/)
    expect(rendered).to match(/English/)
    expect(rendered).to match(/td/)
    expect(rendered).to match(/ty/)
    expect(rendered).to match(/oc/)
  end
end
