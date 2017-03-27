# rubocop:disable ModuleLength
module PreferencesHelper
  MALE_TEEN    = 2**0
  MALE_20_25   = 2**1
  MALE_26_35   = 2**2
  MALE_36_45   = 2**3
  MALE_46_55   = 2**4
  MALE_56_65   = 2**5
  MALE_66      = 2**6
  FEMALE_TEEN  = 2**7
  FEMALE_20_25 = 2**8
  FEMALE_26_35 = 2**9
  FEMALE_36_45 = 2**10
  FEMALE_46_55 = 2**11
  FEMALE_56_65 = 2**12
  FEMALE_66    = 2**13

  BIBLE       = 2**0
  DISABILITY  = 2**1
  VISUAL_IMP  = 2**2
  HEARING_IMP = 2**3
  SPEECH_IMP  = 2**4
  CEREBRAL_P  = 2**5
  HOMELESS    = 2**6

  TRANSPORTATION_WALK = 2**0
  TRANSPORTATION_PUB  = 2**1
  TRANSPORTATION_CAR  = 2**2

  MORNING_MON   = 2**0
  MORNING_TUE   = 2**1
  MORNING_WED   = 2**2
  MORNING_THU   = 2**3
  MORNING_FRI   = 2**4
  MORNING_SAT   = 2**5
  MORNING_SUN   = 2**6
  AFTERNOON_MON = 2**7
  AFTERNOON_TUE = 2**8
  AFTERNOON_WED = 2**9
  AFTERNOON_THU = 2**10
  AFTERNOON_FRI = 2**11
  AFTERNOON_SAT = 2**12
  AFTERNOON_SUN = 2**13
  EVENING_MON   = 2**14
  EVENING_TUE   = 2**15
  EVENING_WED   = 2**16
  EVENING_THU   = 2**17
  EVENING_FRI   = 2**18
  EVENING_SAT   = 2**19
  EVENING_SUN   = 2**20

  # rubocop:disable MethodLength
  def availability_times
    [
      ['8AM - 12PM Monday', MORNING_MON],
      ['8AM - 12PM Tuesday', MORNING_TUE],
      ['8AM - 12PM Wednesday', MORNING_WED],
      ['8AM - 12PM Thursday', MORNING_THU],
      ['8AM - 12PM Friday', MORNING_FRI],
      ['8AM - 12PM Saturday', MORNING_SAT],
      ['8AM - 12PM Sunday', MORNING_SUN],
      ['12PM - 5PM Monday', AFTERNOON_MON],
      ['12PM - 5PM Tuesday', AFTERNOON_TUE],
      ['12PM - 5PM Wednesday', AFTERNOON_WED],
      ['12PM - 5PM Thursday', AFTERNOON_THU],
      ['12PM - 5PM Friday', AFTERNOON_FRI],
      ['12PM - 5PM Saturday', AFTERNOON_SAT],
      ['12PM - 5PM Sunday', AFTERNOON_SUN],
      ['5PM - 9PM Monday', EVENING_MON],
      ['5PM - 9PM Tuesday', EVENING_TUE],
      ['5PM - 9PM Wednesday', EVENING_WED],
      ['5PM - 9PM Thursday', EVENING_THU],
      ['5PM - 9PM Friday', EVENING_FRI],
      ['5PM - 9PM Saturday', EVENING_SAT],
      ['5PM - 9PM Sunday', EVENING_SUN]
    ]
  end

  def age_preference
    [
      ['Male Teen', MALE_TEEN],
      ['Male 20 - 25', MALE_20_25],
      ['Male 26 - 35', MALE_26_35],
      ['Male 36 - 45', MALE_36_45],
      ['Male 46 - 55', MALE_46_55],
      ['Male 56 - 65', MALE_56_65],
      ['Male 66+', MALE_66],
      ['Female Teen', FEMALE_TEEN],
      ['Female 20 - 25', FEMALE_20_25],
      ['Female 26 - 35', FEMALE_26_35],
      ['Female 36 - 45', FEMALE_36_45],
      ['Female 46 - 55', FEMALE_46_55],
      ['Female 56 - 65', FEMALE_56_65],
      ['Female 66+', FEMALE_66]
    ]
  end

  def category_preference
    [
      ['an adult interested in the Bible', BIBLE],
      ['an adult with a developmental disability', DISABILITY],
      ['an adult with visual impairment', VISUAL_IMP],
      ['an adult with hearing impairment', HEARING_IMP],
      ['an adult with speech impairment', SPEECH_IMP],
      ['an adult with cerebral palsy', CEREBRAL_P],
      ['an adult who is or was homeless', HOMELESS]
    ]
  end

  def transportation_preference
    [
      ['Walk', TRANSPORTATION_WALK],
      ['Public', TRANSPORTATION_PUB],
      ['Car', TRANSPORTATION_CAR]
    ]
  end

  # Takes an array of strings of integers and computes the sum
  def squash(arr)
    arr.map(&:to_i).reduce(:+) || 0 unless arr.nil?
  end

  # Returns the number of matches two availability values contain
  def availability_match(t1, t2)
    (t1.to_i & t2.to_i).to_s(2).count('1')
  end

  # Takes an integer and blows it up into an array of powers of 2
  def explode(int)
    int.to_s(2)
       .split('')
       .reverse
       .map.with_index { |v, i| 2**i * v.to_i }
  end

  module_function :squash,
                  :explode,
                  :availability_match
end
