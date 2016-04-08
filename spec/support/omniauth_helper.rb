module OmniauthHelper
  def authenticator
    {
      "provider" => "twitter",
      "uid" => "123456",
      "info" => {
        "name" => "John Q Public",
        "email" => "johndoe@yahoo.com",
        "image" => "http://si0.twimg.com/sticky/default_profile_images"\
        "/default_profile_2_normal.png"
      }
    }
  end
end
