class StudentsController < ApplicationController
  # before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def activate
    @student = Student.find(params[:id])
    set_student
    redirect_to action: "show", id: @student.id
    # render :activate
  end

  private

    def set_student
      puts "in the method!"
      @student = Student.find(params[:id])
      if @student.active == true
        puts "in the in!"
        Student.update(@student.id, :active => false)
      else
        Student.update(@student.id, :active => true)
      end
    end
end