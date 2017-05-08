class FavoriteController < ApplicationController
#何を見せるのか→
    def show
      @wears = current_user.wears.page(params[:page]).per(5).order("created_at DESC")
    end
end
