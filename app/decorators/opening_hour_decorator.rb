class OpeningHourDecorator < ApplicationDecorator

  def display_closed_day
    I18n.t('closed')
  end

  def display_start_at
    object.start_at.strftime('%H:%M')
  end

  def display_end_at
    end_at.strftime('%H:%M')
  end
end
