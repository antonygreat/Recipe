class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update, :show]
  def index 
    @users= User.all
  end
  def new
  	@user =User.new
  end
  def show
  	@user = User.find(params[:id])
  end
  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to Recipe Website. Have fun browing through!"
      redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit 
    
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:success]= "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end 
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

end
