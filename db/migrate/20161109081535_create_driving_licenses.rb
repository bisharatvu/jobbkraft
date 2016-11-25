class CreateDrivingLicenses < ActiveRecord::Migration
  def change
    create_table :driving_licenses do |t|
      t.boolean :dl_am
      t.boolean :dl_aa
      t.boolean :dl_a2
      t.boolean :dl_a
      t.boolean :dl_b
      t.boolean :dl_be
      t.boolean :dl_c
      t.boolean :dl_c1
      t.boolean :dl_ce
      t.boolean :dl_c1e
      t.boolean :dl_d
      t.boolean :dl_d1
      t.boolean :dl_de
      t.boolean :dl_d1e
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
