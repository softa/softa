module SiteHelper

  def twitter(username)
    link_to "Twitter", "http://twitter.com/#{username}", :target => :_blank
  end

  def tweet_this(message)
    link_to t('labs.tweet_this'), "http://twitter.com/?status=#{CGI.escape(message)}", :target => :_blank
  end

  def gravatar(email)
    require 'digest/md5'
    gravatar_id = Digest::MD5.hexdigest(email+'@softa.com.br').to_s
    image_tag 'http://www.gravatar.com/avatar/' + gravatar_id + '?s=84'
  end

end
