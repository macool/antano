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

  def twitter_follow_button
    html = <<-BUTTON
    <a href="https://twitter.com/cuxibamba" class="twitter-follow-button" data-show-count="false" data-lang="es" data-dnt="true">Seguir a @cuxibamba</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
BUTTON
    html.html_safe
    nil
  end
end
