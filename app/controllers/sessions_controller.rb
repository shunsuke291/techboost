class SessionsController < ApplicationController
  def new
  end
  
  

  def create
    user = User.find_by(email: params[:permit][:email])
    
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
end

