module ApplicationHelper
  def breadcrumb(*args)
    content_tag :ol, class: "breadcrumb" do
      args.map do |path|
        if path.is_a?(String)
          content_tag :li, path, class: "active"
        else
          content_tag :li, link_to(path.first, path.last)
        end
      end.join.html_safe
    end
  end

  def disqus_comments(object)
    disqus_identifier = "#{object.class.name.underscore}/#{object.id}"
    content_tag(:div, nil, id: "disqus_thread") + javascript_tag("disqusHelper.load('#{disqus_identifier}');")
  end
end
