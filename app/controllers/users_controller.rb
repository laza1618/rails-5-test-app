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

  def hit_against_wall
    @user = User.find(params[:id])
    @user.hit_against_wall
    flash["warning"] = "Hit against wall on #{@user.name} !!"
    redirect_to users_path
  end

  def set_level_up
    @users = User.find(params[:user_ids].split(','))
    flash[:notice] = []
    @users.each do |user|
      user.level_up
      flash[:notice] << notif_message(user)
    end
    redirect_to users_path
  end

  def set_hit_against_wall
    @users = User.find(params[:user_ids].split(','))
    flash[:warning] = []
    @users.each do |user|
      user.hit_against_wall
      flash[:warning] << notif_message(user)
    end
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :age, :gender, :_type)
    end

    def notif_message(user)
      message = user.name
      case user.class
        when Manager
          message.concat(" can manage #{user.team_size} people")
        when Employee
          message.concat(" have now #{user.skills_number} skills")
        when Intern
          message.concat(" masters #{user.skills.join(',')} and have #{user.work_load} work to do")
      end
    end

end
