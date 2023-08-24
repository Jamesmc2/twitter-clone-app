class TweetsController < ApplicationController
  def index
    relationships = Relationship.where(follower_id: current_user.id)
    @tweets = []
    relationships.each do |relationship|
      @tweets += Tweet.where(user_id: relationship.leader_id)
    end
    @tweets += Tweet.where(user_id: current_user.id)

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
      redirect_to "/myfeed"
    end
  end
end
