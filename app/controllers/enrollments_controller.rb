class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @enrollments = current_student.enrollments
    respond_with(@enrollments)
  end

  def show
    respond_with(@enrollment)
  end

  def new
    @enrollment = Enrollment.new
    @course = Course.find(params[:course]) if params[:course].present?
    respond_with(@enrollment)
  end

  def edit
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.save
    respond_with(@enrollment, :location => enrollments_path)
  end

  def update
    @enrollment.update(enrollment_params)
    respond_with(@enrollment)
  end

  def destroy
    @enrollment.destroy
    respond_with(@enrollment)
  end

  private
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    def enrollment_params
      params.require(:enrollment).permit(:student_id, :course_id, :fee_paid)
    end
end
