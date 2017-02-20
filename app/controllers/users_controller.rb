class UsersController < ApplicationController
  def index
    @users = User.all.to_a
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    flash["success"] = 'New User Created !!'
    redirect_to users_path
  end

  def level_up
    @user = User.find(params[:id])
    @user.level_up
    flash["notice"] = "Level Up on #{@user.name} !!"
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :age, :gender, :_type)
    end

end
