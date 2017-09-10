module ApplicationHelper
  def sanitize_content(text)
      sanitize(text, tags: %w{p a ul ol li table tr td br h2 h2 h3 h4 h5 strong b img})
  end
end
