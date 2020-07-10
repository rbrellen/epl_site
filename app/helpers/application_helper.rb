module ApplicationHelper
  def full_title(page_title = '')
    base_title = "EPL"
    if page_title.empty?
      "English Premier League"
    else
      page_title + " | " + base_title
    end
  end
end
