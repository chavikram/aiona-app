class HonorificsController < ApplicationController
    helper_method :sort_column, :sort_direction

  before_action :set_honorific, only: [:show, :edit, :update, :destroy]

  # GET /honorifics
  def index
    @honorifics = Honorific.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: Rails.application.config.records_per_page)
  end

  # GET /honorifics/1
  def show
  end

  # GET /honorifics/new
  def new
    @honorific = Honorific.new
  end

  # GET /honorifics/1/edit
  def edit
  end

  # POST /honorifics
  def create
    @honorific = Honorific.new(honorific_params)

    if @honorific.save
      redirect_to @honorific, notice: 'Honorific was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /honorifics/1
  def update
    if @honorific.update(honorific_params)
      redirect_to @honorific, notice: 'Honorific was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /honorifics/1
  def destroy
    @honorific.destroy
    redirect_to honorifics_url, notice: 'Honorific was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_honorific
      @honorific = Honorific.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def honorific_params
      params.require(:honorific).permit(:name)
    end

    def sort_column
         Designation.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
      
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
