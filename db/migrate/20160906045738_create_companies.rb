class CreateCompanies < ActiveRecord::Migration
    def change
        create_table :companies do |t|
            t.string :company_name
            t.text   :company_about_us
            t.string :company_address_street
            t.string :company_address_city
            t.string :company_address_zip
            t.string :company_address_country
            t.string :company_invoice_address_street
            t.string :company_invoice_address_city
            t.string :company_invoice_address_zip
            t.string :company_invoice_address_country
            t.string :company_invoice_reference
            t.string :company_invoice_email
            t.string :company_contact_person_first_name
            t.string :company_contact_person_last_name
            t.string :company_contact_person_cell_phone
            t.string :company_contact_person_phone_no
            t.string :company_contact_person_email
            t.boolean :right_of_hiring
            t.boolean :is_active
            t.references :user, index: true, foreign_key: true

            t.timestamps null: false
        end
    end
end
