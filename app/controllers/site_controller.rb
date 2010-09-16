class SiteController < ApplicationController
  def index
    # [{:who => "Juan", :when => Date.today}].to_yaml
    #--- \n- :who: Juan\n  :when: 2010-09-16\n"
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
  end
end
