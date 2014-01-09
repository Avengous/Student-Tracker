module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "YUPS"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def revision
    #Rails.env.production? ? revision = HEAD_HASH : revision = `git rev-parse HEAD`.chomp
    #return revision[0..12]
  end

end
