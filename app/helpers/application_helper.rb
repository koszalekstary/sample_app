module ApplicationHelper
  def fulltitle(title) 
    deftitle = "SampleApp"
    if !title.empty?
      "#{deftitle} | #{title}"
    else
      deftitle
    end
  end
end
