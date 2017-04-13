# rubocop:disable MethodLength
module AssessmentsHelper
  def assessment_category
    [
      ['ABE Reading', 'ABE Reading'],
      ['ABE Writing', 'ABE Writing'],
      ['ABE Math', 'ABE Math'],
      ['ESOL Speaking', 'ESOL Speaking'],
      ['ESOL Reading', 'ESOL Reading'],
      ['ESOL Writing', 'ESOL Writing'],
      ['Other', 'Other']
    ]
  end

  def assessment_name
    [
      ['TABE 9', 'TABE 9'],
      ['TABE 10', 'TABE 10'],
      ['MAPT', 'MAPT'],
      ['MATH', 'MATH'],
      ['BEST Plus', 'BEST Plus'],
      ['Clas-E(A)', 'Clas-E(A)'],
      ['Clas-E(B)', 'Clas-E(B)'],
      ['Text', 'Text']
    ]
  end

  def assessment_level
    [
      ['Does not apply', 'Does not apply'],
      ['Easy', 'Easy'],
      ['Medium', 'Medium'],
      ['Difficult', 'Difficult'],
      ['1', '1'],
      ['2', '2'],
      ['3', '3'],
      ['4', '4'],
      ['Text', 'Text']
    ]
  end

  def assessment_type
    [
      ['Does not apply', 'Does not apply'],
      ['Literacy', 'Literacy']
    ]
  end

  module_function :assessment_category,
                  :assessment_name,
                  :assessment_level,
                  :assessment_type
end
