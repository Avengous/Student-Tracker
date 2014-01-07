class StudentsController < ApplicationController
  def index
    @title = "Students"
    @student = Student.all
  end
  
  def new
    @student = Student.new
    @title = "New Student"
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render 'new'
    end
  end
  
  def edit
    @student = Student.find(params[:id])
    @title = "Editing #{@student.firstname}"
  end
  
  def update
    if @student.update_attributes(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end
  
  def destroy
    Student.find(params[:id]).destroy
    redirect_to students_url
  end
  
  private
  
    def student_params
      params.require(:student).permit(:firstname, :lastname, :email)
    end
end
