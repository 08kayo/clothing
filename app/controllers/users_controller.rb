class UsersController < ApplicationController

    def index   #トップページ
      redirect_to @user, notice: '登録が完了しました'
      redirect_to login_url, alert: '赤字を確認してください'
    end

    def show
      @nickname = current_user.nickname
      @wears = current_user.wears.page(params[:page]).per(5).order("created_at DESC")
    end



end
