module CuxibambaBuilder
  def create_cuxibamba!
    # so that it doesn't need to ask twitter for @cuxibamba
    build(:profile, user: nil,
                     uid: "451110436",
                     provider: "twitter",
                     name: "Valle de Cuxibamba",
                     nickname: "cuxibamba",
                     image: "http://pbs.twimg.com/profile_images/2317193138/image_normal.jpg",
                     location: "Loja",
                     description: "Fue un 8 de Diciembre cuando Alonso de Mercadillo fundó, en el Valle de Cuxibamba, a la Inmaculada Concepción de Loxa. Fui construido para hacer eco :)").tap do |profile|
      profile.user = User.create_or_update_from_profile(profile)
      profile.save!
    end
  end
end
