module ApplicationHelper
  def full_title(title) 
    deftitle = "Ruby on Rails Tutorial Sample App"
    if !title.empty?
      "#{deftitle} | #{title}"
    else
      deftitle
    end
  end
end
