class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.references :course, index: true
      t.string :name
      t.string :order_number

      t.timestamps
    end
  end
end
