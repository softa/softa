class SiteController < ApplicationController

  def set_initial_locale
    redirect_to "/#{lookup}"
  end

  def index
<<<<<<< HEAD
    I18n.locale = params[:lang]
    @events = []
=======
=begin
    require 'open-uri'
    require 'ostruct'
    feed = 'http://www.google.com/calendar/feeds/62loik9tem085k7v8rrgjg0138%40group.calendar.google.com/public/basic'
    doc = Hpricot.XML(open(feed).read)
    @events = []
    doc.search('entry').each do |entry|
        content = (entry%'content').html
            whn = content.scan(/Quando: (.+201\d)/).to_s
            whr = content.scan(/Onde: (.+)/).to_s
           desc = content.scan(/Descrição do evento: (.+)/).to_s
           link = content.scan(/http:\/\//).to_s
      event_url = content.scan(/http:\/\//).to_s
      @events << OpenStruct.new({
        :title     => (entry%'title').html,
        :when      => whn,
        :where     => whr,
        :desc      => desc,
        :link      => link,
        :event_url => event_url
      })
    end
=end
>>>>>>> c899cd0a9d77b5933bcdc500e733b6b9c6291add
  end

protected
  def lookup
    ipnum = request.ip.split(/\./).reverse.each_with_index.map{|v,i| v.to_i*256**i }.sum
    COUNTRIES.detect{|country| country.first === ipnum }.last rescue :en
  end

end
