class Chapter < ActiveRecord::Base
  belongs_to :course
  validates :name, :order_number, :course_id, presence: true
  validates :name, uniqueness: { scope: :course_id, message: "chapter already registered for this course" }
  validates :order_number, numericality: true
end
