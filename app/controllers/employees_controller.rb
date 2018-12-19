class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render :show
    else
      redirect_to "/employees/new"
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @dogs = Dog.all
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      render :show
    else
      redirect_to edit_employee_path(@employee)
    end
  end




  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :title, :alias, :img_url, :dog_id, :office)
  end
end
