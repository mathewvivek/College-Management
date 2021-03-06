class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_action :access_control, except: [:index, :show]

  respond_to :html

  def index
    @chapters = staff_signed_in? ? current_staff_chapters : Chapter.all
    @chapters = Chapter.all if admin_option?
    respond_with(@chapters)
  end

  def show
    respond_with(@chapter)
  end

  def new
    @chapter = Chapter.new
    respond_with(@chapter)
  end

  def edit
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.save
    respond_with(@chapter, location: chapters_path)
  end

  def update
    @chapter.update(chapter_params)
    respond_with(@chapter, location: chapters_path)
  end

  def destroy
    @chapter.destroy
    respond_with(@chapter, location: chapters_path)
  end

  private

    def current_staff_chapters
      Chapter.where("course_id in (#{staff_courses})")
    end

    def staff_courses
      current_staff.courses.collect(&:id).join(',')
    end

    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    def chapter_params
      params.require(:chapter).permit(:course_id, :name, :order_number)
    end
end
