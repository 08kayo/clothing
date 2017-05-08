class ClothingsController < ApplicationController
  

   def index  # Homeのページにくる内容
      # clothingテーブルから最新順に投稿を5０件取得する
      #includesいらない？
     @clothings = Photo.includes(:user).order('created_at DESC').limit(50)
   end

   def show  #
     @clothing = Photo.find(params[:id])
   end

   def new  #新しい投稿画面
    end

   def create  #投稿作成の画面？
     Photo.create(image: clothing_params[:image], text: clothing_params[:text], user_id: current_user.id)
  end

   def update  #投稿の更新
     clothing = Photo.find(params[:id])
     if clothing.user_id == current_user.id
       clothing.update(clothing_params) 
     end
   end

   def destroy  #投稿の削除
     clothing = Photo.find(params[:id])
     clothing.destroy if clothing.user_id == current_user.id
    end

   def edit  #投稿の再編集
     @clothing = Photo.find(params[:id])
    end

    private
    def clothing_params
      params.permit(:image, :text)
    end
  end