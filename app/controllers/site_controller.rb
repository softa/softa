class SiteController < ApplicationController

  def set_initial_locale
    redirect_to "/#{lookup}"
  end

  def index
    I18n.locale = params[:lang]
    @events = []
  end

protected
  def lookup
    ipnum = request.ip.split(/\./).reverse.each_with_index.map{|v,i| v.to_i*256**i }.sum
    COUNTRIES.detect{|country| country.first === ipnum }.last rescue :en
  end

end
