class CategoriesController < ApplicationController
    def show
      @nickname = current_user.nickname
      @clothings = current_user.clothings.page(params[:page]).per(5).order("created_at DESC")
    end

end
