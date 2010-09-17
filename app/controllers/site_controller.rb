class SiteController < ApplicationController

  VALID_LANGS = %w{pt en es fr}
  caches_page :index

  # Used to redirect a users that enters "softa.com.br"
  # based on his IP.
  def set_initial_locale
    redirect_to "/#{lookup}"
  end

  def index
    return redirect_to '/en' unless VALID_LANGS.include?(params[:lang])
    I18n.locale = params[:lang]
    @events = YAML.load_file("#{Rails.root}/config/schedule.yml")
    require 'open-uri'
    require 'ostruct'
    doc = Hpricot.XML(open('http://blog.softa.com.br/rss.xml').read)
    @posts = (doc/'item')[0..4].map do |item|
      OpenStruct.new({
        :title => (item%'title').inner_text,
        :link => (item%'link').inner_text,
        :desc => view_context.strip_tags((item%'description').inner_text).gsub(/\s+/, ' ')[0..150]
      })
    end
  end

  # Used to expire cache
  # It would be nice if tumblr had a hook for it
  # It would...
  def cache
    render :text => VALID_LANGS.map{|lang| File.delete("#{Rails.root}/public/#{lang}.html") rescue "#{lang} not found" }.join("<br />")
  end

  # Sends the email via ajax.
  def contact
    Site.deliver_contact(params)
    render :json => {:ok => true}.to_json
  rescue 
    render :json => {:ok => false}.to_json
  end

protected

  def lookup
    ipnum = request.ip.split(/\./).reverse.each_with_index.map{|v,i| v.to_i*256**i }.sum
    COUNTRIES.detect{|country| country.first === ipnum }.last rescue :en
  end

end
