module ApplicationHelper
  def add_breadcrumbs(*args)
    breadcrumbs current_breadcrumbs + args
  end

  def breadcrumbs(paths=current_breadcrumbs)
    content_tag :ol, class: "breadcrumb" do
      paths.map do |path|
        if path.is_a?(Array) and path === paths.last
          content_tag :li, path.first, class: "active"
        elsif path.is_a?(String)
          content_tag :li, path, class: "active"
        else
          content_tag :li, link_to(path.first, path.last)
        end
      end.join.html_safe
    end
  end

  # def add_breadcrumbs(*args)
  #   content_tag :ol, class: "breadcrumb" do
  #     breadcrumbs.concat(args).map do |path|
  #
  #     end
  #   end
  # end

  def disqus_comments(object)
    disqus_identifier = "#{object.class.name.underscore}/#{object.id}"
    content_tag(:div, nil, id: "disqus_thread") + javascript_tag("disqusHelper.load('#{disqus_identifier}');")
  end

  def for_admin(&block)
    yield if current_user and current_user.admin?
  end
end
