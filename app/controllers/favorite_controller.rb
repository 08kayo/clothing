class FavoriteController < ApplicationController
  def create

    @user_id = current_user.id
    @wear_id = Wear.find(params[:id]).id
    @favorite = Favorite.new(wear_id: @wear_id, user_id: @user_id)

      if @wear.save
        redirect_to user_path(current_user)
      end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      redirect_to user_path(current_user)
    end
  end

end
