module ApplicationHelper
  def flash_class(flash_type)
    hash_map = {
        success: 'bg-green',
        error: 'bg-red',
        alert: 'bg-orange',
        notice: 'bg-aqua'
    }
    hash_map[flash_type.to_sym] || 'bg-green'
  end

  # Sample format 15 Jul 2015
  def date_in_dmy(date)
    if date.present?
      begin
        result = date.strftime('%e-%b-%Y')
      rescue
        result = 'NA'
      end
    else
      result = 'NA'
    end
    result
  end

  # sample 15-Jul-2015 10:00 AM
  def date_with_time(date)
    if date.present?
      begin
        result = date.strftime('%e-%b-%Y %l:%M %p')
      rescue
        result = 'NA'
      end
    else
      result = 'NA'
    end
    result
  end
end
