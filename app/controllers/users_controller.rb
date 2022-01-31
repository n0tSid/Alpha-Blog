class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username.capitalize}. You have successfully signed up"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show 
    @movies = @user.movies.paginate(page: params[:page], per_page: 3)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You've successfully updated your profile"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "User profile and all associated data deleted"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user
        flash[:alert] = "You are not authorised to perform this action"
        redirect_to @user
      end
    end

end
