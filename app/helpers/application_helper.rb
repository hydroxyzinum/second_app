module ApplicationHelper

  def full_title(page_title = '')
  base_title = "Welcome in the Sample App II"
    if page_title.empty?
      page_title
    else
      page_title + " | " + base_title
    end
  end

end
