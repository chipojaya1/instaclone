class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
      @users = User.all.order(created_at: "DESC")
    end

    def new
      @user = User.new
      if logged_in?
        redirect_to posts_path
      end
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to posts_path
      else
        render 'new'
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      if @user.id == current_user.id
        if @user.update(user_params)
          redirect_to @user, notice: 'Acoount updated'
        else
          render :edit
        end
      end
    end

    def icon
      @posts = current_user.favorite_posts
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon, :icon_cache)
    end
  end
