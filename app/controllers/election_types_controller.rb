class ElectionTypesController < ApplicationController
  


    helper_method :sort_column, :sort_direction

  before_action :set_election_type, only: [:show, :edit, :update, :destroy]

  # GET /election_types
  def index
    
    @election_types = ElectionType.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: Rails.application.config.records_per_page)

  end

  # GET /election_types/1
  def show
  end

  # GET /election_types/new
  def new
    @election_type = ElectionType.new
  end

  # GET /election_types/1/edit
  def edit
  end

  # POST /election_types
  def create
    
    @election_type = ElectionType.new(election_type_params)

    respond_to do |format|
      if @election_type.save
        format.html { redirect_to @election_type, notice: 'Election Type was successfully created.' }
        format.json { render :show, status: :created, location: @election_type }
      else
        format.html { render :new }
        format.json { render json: @election_type.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /election_types/1
  def update

    respond_to do |format|
      if @election_type.update(election_type_params)
        format.html { redirect_to @election_type, notice: 'Election Type was successfully updated.' }
        format.json { render :show, status: :created, location: @election_type }
      else
        format.html { render :edit }
        format.json { render json: @election_type.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /election_types/1
  def destroy
    
    if @election_type.destroy.destroyed?
         @election_type.destroy
    end  
    respond_to do |format|
        format.html { redirect_to @election_type, notice: 'Election Type was successfully destroyed.' }
        format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election_type
      @election_type = ElectionType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def election_type_params
      params.require(:election_type).permit(:name, :deleted,:sort_order)
    end


    def sort_column
         ElectionType.column_names.include?(params[:sort]) ? params[:sort] : "sort_order"
    end
      
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
