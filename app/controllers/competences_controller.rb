class CompetencesController < ApplicationController
  before_action :set_competence, only: [:show, :edit, :update, :destroy]

  autocomplete :competence, :competence_name, full: true

  # GET /competences
  # GET /competences.json
  def index
    @competences = Competence.all
  end

  # GET /competences/1
  # GET /competences/1.json
  def show
  end

  # GET /competences/new
  def new
    @competence = Competence.new
  end

  # GET /competences/1/edit
  def edit
    @user = current_user
  end

  # POST /competences
  # POST /competences.json
  def create
    @user = current_user
    @competence = Competence.where(competence_name: params[:competence][:competence_name])
    if @competence.count == 0
      if @user.competences.count == 0
        @user.user_profile_progress += 10
      end
      @competence = Competence.create(competence_params)
      @user_competence = @user.user_competences.create(competence_id: @competence.id, competence_level: params[:competence][:competence_level])

    elsif @user.user_competences.where(competence_id: @competence.first.id).count == 0
      @user_competence = @user.user_competences.create(competence_id: @competence.first.id, competence_level: params[:competence][:competence_level])

    else
      redirect_to '/profile#addMoreCompetences', alert: t('competences_controller.competences_create_error')
    end
    respond_to do |format|
      if @user_competence.save!
        @user.save!
        format.html { redirect_to '/profile#addMoreCompetences', notice: t('competences_controller.competences_create_success') }
        format.json { render :show, status: :created, location: @competence }
      else
        format.html { render :new }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competences/1
  # PATCH/PUT /competences/1.json
  def update

    respond_to do |format|
      if @competence.update(competence_params)
        format.html { redirect_to '/profile#addMoreCompetences', notice: t('competences_controller.competences_update_success') }
        format.json { render :show, status: :ok, location: @competence }
      else
        format.html { render :edit }
        format.json { render json: @competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competences/1
  # DELETE /competences/1.json
  def destroy
      @user = current_user
      if @user.competences.count == 1
          @user.user_profile_progress -= 10
      end
    @competence.destroy
    @user.save!
      respond_to do |format|
      format.html { redirect_to '/profile#addMoreCompetences', notice: t('competences_controller.competences_delete_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competence
      @competence = current_user.user_competences.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competence_params
      params.require(:competence).permit(:competence_name)
    end
end
