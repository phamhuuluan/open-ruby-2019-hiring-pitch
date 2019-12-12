module ApplicationHelper
  def full_title page_title = ""
    base_title = t".base_title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end  

  def image avatar = ""
    avatar_url = Settings.helper.avatar
    avatar.nil? ? avatar_url : avatar
  end
end
