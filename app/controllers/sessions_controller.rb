class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to @user                                                         # ログインしたユーザーのページにリダイレクト
    else
      flash.now[:danger] = 'Invalid email/password combination'                 # flashメッセージを表示し、新しいリクエストが発生した時に消す
      render 'new'                                                              # newビューの出力
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
