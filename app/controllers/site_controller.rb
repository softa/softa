class SiteController < ApplicationController

  caches_page :index

  def set_initial_locale
    redirect_to "/#{lookup}"
  end

  def index
    
    I18n.locale = params[:lang]
    @events = YAML.load_file("#{Rails.root}/config/schedule.yml")
    require 'open-uri'
    require 'ostruct'
    #raise open('http://blog.softa.com.br/rss.xml').read
    doc = Hpricot.XML(open('http://blog.softa.com.br/rss.xml').read)
    @posts = (doc/'item')[0..4].map do |item|
      OpenStruct.new({
        :title => (item%'title').inner_text,
        :link => (item%'link').inner_text,
        :desc => view_context.strip_tags((item%'description').inner_text).gsub(/\s+/, ' ')[0..150]
      })
    end
    #raise @posts.inspect
  end

protected

  def lookup
    ipnum = request.ip.split(/\./).reverse.each_with_index.map{|v,i| v.to_i*256**i }.sum
    COUNTRIES.detect{|country| country.first === ipnum }.last rescue :en
  end

end
