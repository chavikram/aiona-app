class ElectionsController < ApplicationController

  helper_method :sort_column, :sort_direction
  before_action :set_election, only: [:show, :edit, :update, :destroy]

  # GET /elections
  def index
    @elections = Election.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: Rails.application.config.records_per_page)
  end

  # GET /elections/1
  def show
  end

  # GET /elections/new
  def new
    @election = Election.new
  end

  # GET /elections/1/edit
  def edit
  end

  # POST /elections
  def create
    
    @election = Election.new(election_params)
    print "#{election_params[:election_start_time]}"
    @election.election_start_time = DateTime.parse( election_params[:election_start_time].to_s, "%d/%m/%Y %I:%M %p") unless params[:election_start_time].blank?


    respond_to do |format|
      if @election.save
        format.html { redirect_to @election, notice: 'Election Type was successfully created.' }
        format.json { render :show, status: :created, location: @election }
      else
        format.html { render :new }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /elections/1
  def update
    #render :text=> election_params[:election_start_time]
    
    @election.election_start_time = DateTime.strptime(election_params[:election_start_time],"%d/%m/%Y %I:%M %p") unless election_params[:election_start_time].blank?

    respond_to do |format|
      if @election.update(election_params)
        format.html { redirect_to @election, notice: 'Election Type was successfully updated.' }
        format.json { render :show, status: :created, location: @election }
      else
        format.html { render :edit }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /elections/1
  def destroy
    
    if @election.destroy.destroyed?
         @election.destroy
    end  
    respond_to do |format|
        format.html { redirect_to @election, notice: 'Election Type was successfully destroyed.' }
        format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election
      @election = Election.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.

    def election_params
      params.require(:election).permit(:name, :election_date, :election_start_time, :election_end_time, :extended_time, :election_type_id, :sort_order, :deleted,:active)
    end


    def sort_column
         Election.column_names.include?(params[:sort]) ? params[:sort] : "sort_order"
    end
      
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end

