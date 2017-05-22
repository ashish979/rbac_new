module ApplicationHelper
  include AmountSplitter

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

  def display_field(field)
    field.present? ? field : '-'
  end

  def float_and_round(field)
    field.to_f.round(2)
  end

  def date_field(name, value = nil, options = {})
    "<span class='input-group datepicker'>
      #{text_field_tag name, value, options}
      <span class='input-group-addon'>
        <i class='fa fa-calendar' aria-hidden='true'></i>
      </span>
    </span>".html_safe
  end

  def ransack_date_field(f, name, options = {})
    placeholder = options[:placeholder] || 'YYYY-MM-DD'
    options = options.merge(placeholder: placeholder)
    "<span class='input-group datepicker'>
      #{f.search_field name, options}
      <span class='input-group-addon'>
        <i class='fa fa-calendar' aria-hidden='true'></i>
      </span>
    </span>".html_safe
  end

  def time_field(method, options = {})
    "<span class='input-group timepicker'>
      #{text_field method, options}
      <span class='input-group-addon'>
        <i class='fa fa-clock-o' aria-hidden='true'></i>
      </span>
    </span>".html_safe
  end
end

class CustomFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::AssetTagHelper

  def date_field(method, options = {})
    "<span class='input-group datepicker'>
      #{text_field method, options}
      <span class='input-group-addon'>
        <i class='fa fa-calendar' aria-hidden='true'></i>
      </span>
    </span>".html_safe
  end

  def time_field(method, options = {})
    "<span class='input-group timepicker'>
      #{text_field method, options}
      <span class='input-group-addon'>
        <i class='fa fa-clock-o' aria-hidden='true'></i>
      </span>
    </span>".html_safe
  end
end

ActionView::Base.default_form_builder = CustomFormBuilder
