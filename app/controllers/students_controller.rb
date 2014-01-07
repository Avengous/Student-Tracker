class StudentsController < ApplicationController
  def index
    @title = "Students"
    @student = Student.all
  end
end
