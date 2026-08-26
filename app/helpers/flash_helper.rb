module FlashHelper
  def flash_class(type)
    case type
    when "notice" then "success"
    when "alert" then "danger"
    else type
    end
  end
end
