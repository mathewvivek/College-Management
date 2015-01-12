class HomeController < ApplicationController

	def get_students
	  @students = Student.all
	end

	def get_staffs
	  @staffs = Staff.all
	end

end
