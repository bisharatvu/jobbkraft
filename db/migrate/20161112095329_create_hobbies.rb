class CreateHobbies < ActiveRecord::Migration
  def change
    create_table :hobbies do |t|
      t.string :hobby_icon
      t.string :hobby_name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
