module ApplicationHelper
  def full_title(title) 
    deftitle = "SampleApp"
    if !title.empty?
      "#{deftitle} | #{title}"
    else
      deftitle
    end
  end
end
