class Course < ActiveRecord::Base
  belongs_to :staff
  has_many :chapters
  has_many :students, :through =>:enrollments
  has_many :enrollments, :dependent =>:destroy

  validates :name, :department, :fee_amount, :duration_in_months, presence: true
  validates :fee_amount, :duration_in_months, numericality: true
end
