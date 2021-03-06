module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "BCbooks"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  def logo
    image_tag("logo.jpg", :alt => "BC Books", :class => "round")
  end
end
