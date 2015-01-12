class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :access_control, except: [:index, :show]

  respond_to :html

  def index
    @courses = staff_signed_in? ? current_staff.courses : Course.all
    respond_with(@courses)
  end

  def show
    respond_with(@course)
  end

  def new
    @course = Course.new
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    @course.staff_id = current_staff.id
    @course.save
    respond_with(@course, location: courses_path)
  end

  def update
    @course.update(course_params)
    respond_with(@course, location: courses_path)
  end

  def destroy
    @course.destroy
    respond_with(@course, location: courses_path)
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :department, :description, :duration_in_months, :fee_amount, :staff_id)
    end
end
