class Front::PagesController < ApplicationController

  def index
    @banners = Banner.order(rank: :asc)
    @spotlights = Spotlight.order(rank: :asc)
  end
  
  def about
  end

  def service
  end

  def download
  end

  def no_d2
  end

end
