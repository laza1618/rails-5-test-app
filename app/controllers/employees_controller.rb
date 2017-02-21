class EmployeesController < ApplicationController
  def new
  end

  def edit
    @employee = User.find(params[:id])
  end

  def update
    @employee = User.find(params[:id])
    if @employee.update(employee_params)
      flash["success"] = 'Manager Updated !!'
      redirect_to users_path
    else
      flash["error"] = @employee.errors.full_messages
      render :edit
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :age, :gender, :skills_number)
    end
end
