class UsersController < ApplicationController

  autocomplete :user, :username, :extra_data => [:first_name, :last_name]

  before_action :confirm_logged_in
  before_action :user_admin, except: [:show, :index]
  #before_action :correct_user, only: [:edit, :update, :show]


  def index
    if params[:search]
      @users = User.search(params[:search]).sorted
    else
      @users = User.all.sorted
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation, :admin)
  end

end
