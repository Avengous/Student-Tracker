class StudentsController < ApplicationController
  def index
    @title = "Students"
    @student = Student.all
  end
  
  def show
    @student = Student.find(params[:id])
    @transaction = Transaction.where(:student_id => @student.id)
    
    @title = "History"
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
    @student = Student.find_by_id(params[:id])
    if @student.update_attributes(student_params)
      redirect_to students_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Student.find(params[:id]).destroy
    redirect_to students_url
  end
  
  def add_multiple_students
    @title = "Add Students"
    @entries = params[:entries]
    multicreate
  end
  
  def multicreate
    if @entries.nil? then
    else
      @entries.each_line do |entry|
        entry = entry.split(" ")    
        @student = Student.new(firstname: entry[0], lastname: entry[1], email: entry[2].downcase)
        @student.save
      end
      redirect_to students_url
    end
  end
  
  private
  
    def student_params
      params.require(:student).permit(:firstname, :lastname, :email)
    end
end
