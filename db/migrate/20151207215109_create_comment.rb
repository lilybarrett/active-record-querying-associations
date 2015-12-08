class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :recipe_id, null: false
      t.string :comment, null: false

      t.timestamps null: false
    end
  end
end

#note to self: .string datatype has limit of 255 char. .text can be variable length.
