class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, :age, :phone, :identity_proof, presence: true

  has_many :courses, :through =>:enrollments
  has_many :enrollments, :dependent =>:destroy
end
