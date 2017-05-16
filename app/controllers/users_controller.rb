class UsersController < ApplicationController
    def index   #トップページ。このページ必要？
      redirect_to @user, notice: '登録が完了しました'
      redirect_to login_url, alert: '赤字を確認してください'
    end

    def show
     @wears = Wear.where(user_id: params[:id])
     @user = User.find(params[:id])
     @favorites = Favorite.where("user_id = ?", @user)
     @nickname = current_user.nickname
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Wear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:text, :image)
    end
end
