class PagesController < ApplicationController
  def show
    @page = Page.find_by_id(params[:id])
  end
end
