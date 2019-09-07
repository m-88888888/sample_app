class AccountActivationsController < ApplicationController

  # アカウントを有効化するeditアクション
  def edit
    user = User.find_by(email: params[:email])  # DBからユーザ取得
    if user && !user.activated? && user.authenticated?(:activation, params[:id])  # ユーザが有効であるかを確認
      user.activate  # ユーザ有効化
      user.update_attribute(:activated_at, Time.zone.now) # タイムゾーンの更新
      log_in user #　ログイン
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end
