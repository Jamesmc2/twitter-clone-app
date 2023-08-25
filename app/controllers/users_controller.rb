class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      profile_picture_url: params[:user][:profile_picture_url],
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if current_user.id == params[:id].to_i
      @user = current_user
      render :edit
    else
      redirect_to "/myfeed"
    end
  end

  def update
    @user = User.find_by(id: current_user.id)
    @user.update(
      name: params[:user][:name],
      email: params[:user][:email],
      profile_picture_url: params[:user][:profile_picture_url],
    )
    redirect_to "/users/#{current_user.id}"
  end

  def liked_tweets
    @liked_tweets = Like.where(user_id: params[:id])
    render :liked_tweets
  end
end
