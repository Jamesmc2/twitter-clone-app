class LikesController < ApplicationController
  def create
    @like = Like.new(
      tweet_id: params[:tweet_id],
      user_id: current_user.id,
    )
    @like.save
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @like.destroy
  end
end
