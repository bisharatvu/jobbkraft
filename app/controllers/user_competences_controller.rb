class UserCompetencesController < ApplicationController
  before_action :set_user_competence, only: [:show, :edit, :update, :destroy]

  # GET /user_competences
  # GET /user_competences.json
  def index
    @user_competences = UserCompetence.all
  end

  # GET /user_competences/1
  # GET /user_competences/1.json
  def show
  end

  # GET /user_competences/new
  def new
    @user_competence = UserCompetence.new
  end

  # GET /user_competences/1/edit
  def edit
    @user = current_user
    @user_competence.competence_name = Competence.find(@user_competence.competence_id).competence_name
  end

  # POST /user_competences
  # POST /user_competences.json
  def create
    @user = current_user

    @competence = Competence.where(competence_name: params[:user_competence][:competence_name])
    if @competence.count == 0
      if @user.competences.count == 0
        @user.user_profile_progress += 10
      end
      @competence = Competence.create(competence_params)
      @user_competence = @user.user_competences.create(competence_id: @competence.id, competence_level: params[:user_competence][:competence_level])

    elsif @user.user_competences.where(competence_id: @competence.first.id).count == 0
      @user_competence = @user.user_competences.create(competence_id: @competence.first.id, competence_level: params[:user_competence][:competence_level])
    else
      redirect_to '/profile#addMoreCompetences', alert: t('competences_controller.competences_create_error')
    end
    respond_to do |format|
      if @user_competence.save!
        @user.save!
        format.html { redirect_to '/profile#addMoreCompetences', notice: t('competences_controller.competences_create_success') }
        format.json { render :show, status: :created, location: @competence }
        format.js
      else
        format.html { render :new }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_competences/1
  # PATCH/PUT /user_competences/1.json
  def update
    @check_competence = Competence.where(competence_name: params[:competence][:competence_name])
    if @check_competence.count == 0
      @check_competence = Competence.create(competence_params)
      @user_competence = @competence.update(competence_id: @check_competence.id, competence_level: params[:competence][:competence_level])
    else
      @user_competence = @user_competence.update(competence_id: @check_competence.first.id, competence_level: params[:competence][:competence_level])
    end
    respond_to do |format|
      if @user_competence.save
        format.html { redirect_to '/profile#addMoreCompetences', notice: t('competences_controller.competences_update_success') }
        format.json { render :show, status: :ok, location: @user_competence }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user_competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_competences/1
  # DELETE /user_competences/1.json
  def destroy
    @user_competence.destroy
    respond_to do |format|
      format.html { redirect_to user_competences_url, notice: 'User competence was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_competence
      @user_competence = UserCompetence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_competence_params
      params.require(:user_competence).permit(:user_id , :competence_level)
    end
  def competence_params
      params.require(:user_competence).permit(:competence_name)
  end
end
