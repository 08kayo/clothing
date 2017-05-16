class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, wear_id: params[:wear_id])
    @likes = Like.where(wear_id: params[:wear_id])
    @wears = Wear.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, wear_id: params[:wear_id])
    like.destroy
    @likes = Like.where(wear_id: params[:wear_id])
    @wears = Wear.all
  end
end
