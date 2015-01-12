class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :department
      t.integer :duration_in_months
      t.string :fee_amount
      t.references :staff
      t.timestamps
    end
  end
end
