module ApplicationHelper
  
  def l(object, options = {})
    super(object, options) if object
  end  
  
  def icon_link_to(path, opts = {}, link_opts = {})
    classes = []
    [:icon, :blank].each do |klass|
      if k = opts.delete(klass)
        classes << "#{k}"
      end
    end
    classes << "enlarge" if opts.delete(:enlarge)
    opts[:class] ||= ""
    opts[:class] << " " << classes.join(" ")
    link_to content_tag(:i, "", opts), path, link_opts
  end


  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end



end
