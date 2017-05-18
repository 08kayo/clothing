class WearsController < ApplicationController
  
   before_action :move_to_index, except: :index

   def index  # Homeのページにくる内容
      # wearテーブルから最新順に投稿を5０件取得する
      #includesいらない？

      FlickRaw.api_key=ENV["FLICKR_KEY"]
      FlickRaw.shared_secret=ENV["FLICKR_ACCESS_KEY"]

      word = "tshirt"

      # tag:  検索タグ。
      # sort: ソート順。デフォルトは「date-posted-desc」。
      #       「relevance」は関連度の高さでソート。
      # per_page: 検索した時の取得件数。デフォルトは100件。
     @images = flickr.photos.search(tags: word, sort: "relevance", per_page: 52)

     @wears = Wear.includes(:user).order('created_at DESC').limit(50)
     if current_user
       @nickname = current_user.nickname
     else
       @nickname = 'ログインしていません'
     end
   end

   def show  #全ユーザーが投稿した画像の一覧
     @wears = Wear.includes(:user).order('created_at DESC').limit(50)
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

   def search #投稿の検索
     if params[:text] != nil
      @wears = Wear.where('text LIKE(?)', params[:text]).limit(20)
    elsif params[:price] != nil
      @wears = []
    else
      @wears = []
    end

    end

    private
   def wear_params
      params.require(:wear).permit(:image, :text)
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