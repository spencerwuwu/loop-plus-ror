class Front::PagesController < ApplicationController
  layout 'front'

  def index
    @banners = Banner.order(rank: :asc)
  end
  
  def about
  end

  def service
  end

  def download
  end

end
