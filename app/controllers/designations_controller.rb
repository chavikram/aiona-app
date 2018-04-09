class DesignationsController < ApplicationController

  	helper_method :sort_column, :sort_direction
    before_action :set_designation, only: [:show, :edit, :update, :destroy]

    def index
    	@designations = Designation.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: Rails.application.config.records_per_page)
    end

    def new
    	@designation = Designation.new
	end
	
	def create
		@designation = Designation.new(designation_params)
		respond_to do |format|
			if @designation.save
				format.html { redirect_to @designation, notice: 'Designation was successfully created.' }
				format.json { render :show, status: :created, location: @designation }
			else
				format.html { render :new }
        		format.json { render json: @designation.errors, status: :unprocessable_entity }
			end
		end
	end



    def show

    end

    def update

		respond_to do |format|
			if @designation.update(designation_params)
				format.html { redirect_to @designation, notice: 'Designation was successfully updated.' }
				format.json { render :show, status: :created, location: @designation }
			else
				format.html { render :new }
        		format.json { render json: @designation.errors, status: :unprocessable_entity }
			end
		end

    end


    def destroy

		if @designation.destroy.destroyed?
	      	@designation.destroy
    	end  
	    	respond_to do |format|
	      		format.html { redirect_to @designation, notice: 'Designation was successfully destroyed.' }
	      		format.json { head :no_content }
	    	end
    end


    def edit

    end
	
	private 
		def set_designation
			@designation = Designation.find(params[:id])
		end
		def designation_params
	      params.require(:designation).permit(:code,:title,:short_code,:sort_order)
	    end

        def sort_column
	       Designation.column_names.include?(params[:sort]) ? params[:sort] : "sort_order"
		end
		  
		def sort_direction
		  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end

end
