class UsersController < ApplicationController

    def index   #トップページ
    end

    def show
      @nickname = current_user.nickname
      @clothes = current_user.clothes.page(params[:page]).per(5).order("created_at DESC")
    end



end
