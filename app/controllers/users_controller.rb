class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit]
  include ActiveStorage::SetCurrent

  def index
    @users = UsersQuery.main_sort(params)
    @sort_by = params[:sort_by]
    @name = params[:name]
    @age = params[:age]
    @count = params[:count]
  end

  def show
    @avatar = @user.avatar.url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.add_user(user_params[:name], user_params[:avatar])
    if @user
      redirect_to @user
    else
      flash.now[:alert] = 'This user already exists!'
      @user = User.new
      render :new
    end
  end

  def edit; end

  def update
    user = User.update_user(user_params[:name], user_params[:avatar], params[:id])
    if user
      redirect_to user
    else
      flash.now[:alert] = 'This user already exists!'
      set_user
      render :edit
    end
  end

  def destroy
    User.delete_user(params[:id])
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
