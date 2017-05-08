class WearsController < ApplicationController
  
   before_action :move_to_index, except: :index

   def index  # Homeのページにくる内容
      # wearテーブルから最新順に投稿を5０件取得する
      #includesいらない？
     @wears = Wear.includes(:user).order('created_at DESC').limit(50)
   end

   def show  
     @wear = Wear.find(params[:id])
   end

  def new  #新しい投稿画面
    @wear = Wear.new
  end

   def create  #投稿完了の
     Wear.create(image: wear_params[:image], text: wear_params[:text], user_id: current_user.id)
  end

   def update  #投稿の更新
     wear = Wear.find(params[:id])
     if wear.user_id == current_user.id
       wear.update(wear_params) 
     end
   end

   def destroy  #投稿の削除
     wear = Wear.find(params[:id])
     wear.destroy if wear.user_id == current_user.id
   end

   def edit  #投稿の再編集
     @wear = Wear.find(params[:id])
   end


    private
   def wear_params
      params.permit(:image, :text)
    end
 
    # Never trust parameters from the scary internet, only allow the white list through.
   def wear_create_params
      params.require(:wear).permit(:text, :image)
   end

   def wear_tag_params
      params.require(:wear).permit(:wear_list)
   end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
  end