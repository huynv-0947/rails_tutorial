module ApplicationHelper
  def full_title sub_title, title = ""
    return sub_title if title.empty?

    title + " | " + sub_title
  end
end
