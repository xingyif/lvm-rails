module AssessmentsHelper
  def assessment_subject
    [
      ['English Literature', 'English Literature'],
      ['US Culture and History', 'US Culture and History'],
      ['English Speaking', 'English Speaking'],
      ['English Listening', 'English Listening'],
      ['English Writing', 'English Writing'],
      ['English Vocabulary', 'English Vocabulary'],
      ['English Reading', 'English Reading']
    ]
  end

  module_function :assessment_subject
end
