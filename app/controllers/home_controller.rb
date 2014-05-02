class HomeController < PhotosController
  expose(:cuxibamba) {
    Profile.fetch(nickname: "cuxibamba", provider: "twitter").user
  }

  def index
  end
end
