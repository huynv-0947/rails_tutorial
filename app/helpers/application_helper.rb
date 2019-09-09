module ApplicationHelper
  def full_title sub_title, title = ""
    return sub_title if title.empty?

    title + " | " + sub_title
  end

  def gravatar_for user
    gravatar_id = Digest::MD5.hexdigest user.email.downcase
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
