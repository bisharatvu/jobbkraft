class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :certificate_name
      t.string :certificate_publisher
      t.string :certificate_publish_date
      t.text :certificate_description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
