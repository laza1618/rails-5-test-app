class ManagersController < ApplicationController
  def new
  end

  def edit
    @manager = User.find(params[:id])
  end

  def update
    @manager = User.find(params[:id])
    if @manager.update(manager_params)
      flash["success"] = 'Manager Updated !!'
      redirect_to users_path
    end
  end

  private
    def manager_params
      params.require(:manager).permit(:name, :age, :gender, :team_size)
    end
end
