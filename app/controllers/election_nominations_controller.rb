class ElectionNominationsController < ApplicationController

  helper_method :sort_column, :sort_direction
  before_action :set_election
  before_action :set_election_nomination, only: [:show, :edit, :update, :destroy]

  # GET /election_nominations
  def index
    @election_nominations = @election.election_nominations.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: Rails.application.config.records_per_page)
  end

  def update_posts
    @election_posts=ElectionPost.find_by("election_id=? and state_id=?",params[:election_id],params[:state_id])

    respond_to do |format|
      format.js
    end

  end

  # GET /election_nominations/1
  def show
  end

  # GET /election_nominations/new
  def new
    @election_nomination = ElectionNomination.new
    @election_nomination.election = @election
  end

  # GET /election_nominations/1/edit
  def edit
  end


  # POST /election_nominations
  def create
    @election_nomination = ElectionNomination.new(election_nomination_params)
    @election_nomination.election = @election

    respond_to do |format|
      if @election_nomination.save
        format.html { redirect_to [@election,@election_nomination], notice: 'Election Nomination was successfully created.' }
        format.json { render :show, status: :created, location: @election_nomination }
      else
        format.html { render :new }
        format.json { render json: @election_nomination.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /election_nominations/1
  def update
    @election_nomination.election = @election
    respond_to do |format|
      if @election_nomination.update(election_nomination_params)
        format.html { redirect_to [@election,@election_nomination], notice: 'Election Nomination was successfully updated.' }
        format.json { render :show, status: :created, location: @election_nomination }
      else
        format.html { render :edit }
        format.json { render json: @election_nomination.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /election_nominations/1
  def destroy
    if @election_nomination.destroy.destroyed?
         @election_nomination.destroy
    end  

    respond_to do |format|
        format.html { redirect_to @election_nomination, notice: 'Election Nomination was successfully destroyed.' }
        format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election
      @election = Election.find(params[:election_id])
    end

    def set_election_nomination
      @election_nomination = ElectionNomination.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.

    def sort_column
         ElectionNomination.column_names.include?(params[:sort]) ? params[:sort] : "sort_order"
    end
      
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    def election_nomination_params
      params.require(:election_nomination).permit(:election_id, :start_date, :form_issue_date, :online_filing_start_date, :online_filing_end_date, :offline_filing_start_date, :offline_filing_end_date, :online_filing_extended_time, :offline_filing_extended_days, :sort_order, :deleted, :active, :result_datetime)
    end

end

