class RedirectController < ApplicationController
  def index
    @page = Page.find_by_path("/"+params[:path].join("/"))
    if @page
      redirect_to(@page)
    else
      redirect_to "/404.html"
    end
  end
end
