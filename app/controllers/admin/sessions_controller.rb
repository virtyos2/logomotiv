class Admin::SessionsController < AdminController
  layout nil
  skip_before_filter :login_required
  
  def new
  end
  
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Авторизация прошла успешно"
      redirect_to(admin_pages_path)
    else
      flash.now[:error] = "Неверная пара логин/пароль."
      render :action => 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end
  
end
