class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def create
    @course = Course.new(course_params)
    @user = current_user
    # @course.user_id = current_user.id
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  def new
    @course = Course.new
    @user = current_user
  end

  def edit
    @course = Course.find(params[:course_id])
  end

  def show
  end

  def update
  end

private

def course_params
  params.require(:course).permit(:title, :description, :price)
end
end
