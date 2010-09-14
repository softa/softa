class SiteController < ApplicationController

  def index
    require 'open-uri'
    require 'hpricot'
    require 'ostruct'
    feed = 'http://www.google.com/calendar/feeds/62loik9tem085k7v8rrgjg0138%40group.calendar.google.com/public/basic'
    doc = Hpricot.XML(open(feed).read)
    @events = []
    doc.search('entry').each do |entry|
      content = (entry%'content').html
#      raise content
      whn = content.scan(/Quando: (.+201\d)/).to_s
      whr = content.scan(/Onde: (.+)/).to_s
      desc = content.scan(/Descrição do evento: (.+)/).to_s
      @events << OpenStruct.new({
        :title => (entry%'title').html,
        :when => whn,
        :where => whr,
        :desc => desc
      })
    end
  end
end
