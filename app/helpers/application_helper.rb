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

  def li_navbar(title, href, options={})
    klass = if current_path.include?(href)
      "active"
    end
    content_tag :li, class: klass do
      link_to title, href, options
    end.html_safe
  end

  def current_path(options = {})
    options = request.params.symbolize_keys.merge(options)
    url_for Rails.application.routes.recognize_path(request.path).merge(options)
  end

  def disqus_comments(object)
    disqus_identifier = "#{object.class.name.underscore}/#{object.id}"
    content_tag(:div, nil, id: "disqus_thread") + javascript_tag("disqusHelper.load('#{disqus_identifier}');")
  end

  def for_admin(&block)
    yield if current_user and current_user.admin?
  end
end
