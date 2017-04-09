# rubocop:disable MethodLength
module StudentsHelper
  def income_ranges
    [
      ['less than $10,000', 'less than $10,000'],
      ['$10,000 - $20,000', '$10,000 - $20,000'],
      ['$20,000 - $80,000', '$20,000 - $80,000'],
      ['more than $80,000', 'more than $80,000']
    ]
  end

  def services
    [
      ['Basic literacy tutoring', 'Basic literacy tutoring'],
      ['ABE class', 'ABE class'],
      ['ESOL tutoring', 'ESOL tutoring'],
      ['ESOL drop-in conversation groups', 'ESOL drop-in conversation groups'],
      ['ESOL classes', ''],
      ['ABE/ESOL transition', 'ESOL classes'],
      ['Computer class', 'Computer class'],
      ['Math class', 'Math class'],
      ['Citizenship class', 'Citizenship class'],
      ['ACT Keys', 'ACT Keys'],
      ['Job training', 'Job training']
    ]
  end
end
