class InternsController < ApplicationController
  def edit
    @intern = User.find(params[:id])
  end

  def update
    @intern = User.find(params[:id])
    if @intern.update(intern_params)
      flash["success"] = 'Intern Updated !!'
      redirect_to users_path
    end
  end

  private
    def intern_params
      result = params.require(:intern).permit(:age, :gender, :name, :skills, :work_load)
      result.merge!(skills: result[:skills].split(','))
    end
end
