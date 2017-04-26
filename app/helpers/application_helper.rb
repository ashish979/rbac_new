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
end
