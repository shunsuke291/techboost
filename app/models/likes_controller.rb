class LikesController < ApplicationController
  def index
    @like_topics = current_user.like_topics
  end

  def create
    like = Like.new #Likeクラスのインスタンスを作成
    like.user_id = current_user.id #current_userのidを変数に代入
    like.topic_id = params[:topic_id]

    if like.save #likeが保存できているかどうかで条件分岐
      redirect_to topics_path, success: 'いいねしました'
    else
      redirect_to topics_path, danger: 'いいねに失敗しました'
    end
  end
  def  destroy
  favorite.find_by(params[:topic_id]).destroy
  flash[:success] = "お気に入りを解除しました"
  redirect_to topics_path
  end
    
  def destroy
    @like = Like.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    @like.destroy
    redirect_to topics_path, success: 'いいねを取り消しました'
  end
end
