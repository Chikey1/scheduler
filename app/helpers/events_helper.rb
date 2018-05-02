module EventsHelper

  def number_of_rows
    [monday_events.count, tuesday_events.count,
    wednesday_events.count, thursday_events.count,
    friday_events.count, saturday_events.count,
    sunday_events.count].max
  end

  def monday_events
    Event.where(day: 'monday').order(:starts_at)
  end

  def tuesday_events
    Event.where(day: 'tuesday').order(:starts_at)
  end

  def wednesday_events
    Event.where(day: 'wednesday').order(:starts_at)
  end

  def thursday_events
    Event.where(day: 'thursday').order(:starts_at)
  end

  def friday_events
    Event.where(day: 'friday').order(:starts_at)
  end

  def saturday_events
    Event.where(day: 'saturday').order(:starts_at)
  end

  def sunday_events
    Event.where(day: 'sunday').order(:starts_at)
  end

  def event_class(event)
    case event&.category
    when 'school'
      'school'
    when 'work'
      'work'
    when 'fun'
      'fun'
    when 'other'
      'other'
    else
      ''
    end
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
