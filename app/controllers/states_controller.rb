class StatesController < ApplicationController

  helper_method :sort_column, :sort_direction
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  def index
    @states = State.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: Rails.application.config.records_per_page)
  end

  def new
    @state = State.new
  end
  
  def create
    @state = State.new(state_params)
    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: 'State was successfully created.' }
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new }
            format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end



  def show

  end

  def update

  respond_to do |format|
    if @state.update(state_params)
      format.html { redirect_to @state, notice: 'State was successfully updated.' }
      format.json { render :show, status: :created, location: @state }
    else
      format.html { render :new }
          format.json { render json: @state.errors, status: :unprocessable_entity }
    end
  end

  end


  def destroy

  if @state.destroy.destroyed?
        @state.destroy
    end  
      respond_to do |format|
          format.html { redirect_to @state, notice: 'State was successfully destroyed.' }
          format.json { head :no_content }
      end
  end


  def edit

  end
  
  private 
    def set_state
      @state = State.find(params[:id])
    end
    def state_params
      params.require(:state).permit(:name, :code)
    end

    def sort_column
         State.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
      
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end


