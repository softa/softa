module SiteHelper

  def twitter(username)
    link_to "@"+username, "http://twitter.com/#{username}", :target => :_blank
  end

end
