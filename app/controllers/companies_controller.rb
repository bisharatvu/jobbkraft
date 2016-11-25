class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_filter :authenticate_company


  # GET /companies
  # GET /companies.json
  def index
    $lmc_left_menu = 'lmc_my_companies'
    $lmc_subleft_menu = ''
    @user = current_user
    @companies = current_user.companies.all.order("companies.is_active DESC NULLS LAST")
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    $lmc_left_menu = 'lmc_my_companies'
    $lmc_subleft_menu = ''
    @user = current_user
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @user = current_user
  end

  # POST /companies
  # POST /companies.json
  def create

  if current_user.companies.where(is_active: true).count < 1
    @company = current_user.companies.create(company_params)
    @company.is_active = true
    @company.save!


  else
    @company = current_user.companies.create(company_params)
  end
    respond_to do |format|
      if @company.save
        params[:company][:category_name].each do |c|
            if c!= ""
                @company.company_categories.create(category_name: c )
            end
            Category.all.each{ |c| Price.create(company_id: @company.id, category_id: c.id) }

        end
        format.html { redirect_to companies_path, notice: t('companies_controller.companies_create_success') }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update


    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: t('companies_controller.companies_update_success') }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: t('companies_controller.companies_delete_success') }
      format.json { head :no_content }
    end
  end
  def active_company
      @current_active_company = current_user.companies.where(is_active: true).first
      @current_active_company.is_active = false
      @current_active_company.save!
      @find_company = Company.find(params[:company][:company_id])
      @find_company.is_active = params[:company][:is_active]
      @find_company.is_active = params[:company][:is_active]
      @find_company.save!

          if @find_company.save
          redirect_to companies_path, notice: t('companies_controller.companies_update_success')
         end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
        @user = current_user
        params.require(:company).permit(:company_name, :company_about_us, :company_address_street,
                                        :company_address_city, :company_address_zip, :company_address_country,
                                        :company_invoice_address_street, :company_invoice_address_city,
                                        :company_invoice_address_zip, :company_invoice_address_country,
                                        :company_invoice_reference, :company_invoice_email,
                                        :company_contact_person_first_name, :company_contact_person_last_name,
                                        :company_contact_person_cell_phone, :company_contact_person_phone_no,
                                        :company_contact_person_email, :company_number, :company_ftex,
                                        :company_web_address, :company_logo, :company_invoice_address_street2,
                                        :company_state, :invoice_person_name, :invoice_person_name_phone_number,
                                        :category_name, :company_phone_number)
    end
end
