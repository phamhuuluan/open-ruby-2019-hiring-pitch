module ApplicationHelper
  def full_title page_title = ""
    base_title = t".base_title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end  

  def get_image object
    object.avatar? ? object.avatar.url : Settings.helper.avatar
  end
end
