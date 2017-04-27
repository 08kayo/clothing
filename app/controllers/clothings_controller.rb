class ClothingsController < ApplicationController
  

   def index  # Homeのページにくる内容
      # clothingテーブルから最新順に投稿を5０件取得する
      #includesいらない？
     @clothings = Clothing.includes(:user).order('created_at DESC').limit(50)
   end

   def show  #
     @clothing = Clothing.find(params[:id])
   end

   def new  #新しい投稿画面
    end

   def create  #投稿作成の画面？
     Clothing.create(image: clothing_params[:image], text: clothing_params[:text], user_id: current_user.id)
  end

   def update  #投稿完了の画面
     clothing = Clothing.find(params[:id])
     clothing.update if clothing.user_id == current_user.id
    end

   def destroy  #投稿の削除
     clothing = Clothing.find(params[:id])
     clothing.destroy if clothing.user_id == current_user.id
    end

   def edit  #投稿の再編集
     @clothing = Clothing.find(params[:id])
    end

end
