json.extract! company, :id, :company_name, :company_address_street, :company_address_city, :company_address_zip, :company_address_country, :company_invoice_address_street, :company_invoice_address_city, :company_invoice_address_zip, :company_invoice_address_country, :company_invoice_reference, :company_invoice_email, :company_contact_person_first_name, :company_contact_person_last_name, :company_contact_person_cell_phone, :company_contact_person_phone_no, :company_contact_person_email, :right_of_hiring, :user_id, :created_at, :updated_at
json.url company_url(company, format: :json)