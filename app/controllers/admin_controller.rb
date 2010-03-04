class AdminController < ApplicationController
  layout "admin"
  before_filter :login_required
  
  def index

  end
  
  protected
  
  def login_required
    begin
      @user = User.find(session[:user_id])
    rescue
      flash[:notice] = "Необходимо авторизоваться для просмотра данной страницы"
      redirect_to "/admin/login"
    end
  end
  
end
