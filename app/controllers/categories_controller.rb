class CategoriesController < ApplicationController
    def show
      @nickname = current_user.nickname
      @wears = current_user.wears.page(params[:page]).per(5).order("created_at DESC")
    end

end
