module EventsHelper

  def number_of_rows
    [monday_events.count, tuesday_events.count,
    wednesday_events.count, thursday_events.count,
    friday_events.count, saturday_events.count,
    sunday_events.count].max
  end

  def monday_events
    Event.where(day: 'monday')
  end

  def tuesday_events
    Event.where(day: 'tuesday')
  end

  def wednesday_events
    Event.where(day: 'wednesday')
  end

  def thursday_events
    Event.where(day: 'thursday')
  end

  def friday_events
    Event.where(day: 'friday')
  end

  def saturday_events
    Event.where(day: 'saturday')
  end

  def sunday_events
    Event.where(day: 'sunday')
  end

  def days_select_array
    [['Monday', 'monday'], ['Tuesday', 'tuesday'],
    ['Wednesday', 'wednesday'], ['Thursday', 'thursday'],
    ['Friday', 'friday'], ['Saturday', 'saturday'],
    ['Sunday', 'sunday']]
  end

  def categories_select_array
    [['Work', 'work'], ['School', 'school'],
    ['Fun/Break', 'fun'], ['Other', 'other']]
  end
end
