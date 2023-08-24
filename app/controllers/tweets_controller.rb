class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    render :index
  end

  def new
    @tweet = Tweet.new
    render :new
  end

  def create
    @tweet = Tweet.new(
      user_id: current_user.id,
      text: params[:tweet][:text],
      image_url: params[:tweet][:image_url],
    )
    if @tweet.save
      redirect_to "/tweets"
    end
  end
end
