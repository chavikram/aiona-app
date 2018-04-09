class MembersController < ApplicationController

  	helper_method :sort_column, :sort_direction
	before_action :set_member, only: [:show, :edit, :update, :destroy]

    def index
    	@members = Member.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: Rails.application.config.records_per_page)
    end

    def new
    	@member = Member.new
	end
	
	def create
		@member = Member.new(member_params)
		respond_to do |format|
			if @member.save
				format.html { redirect_to @member, notice: 'member was successfully created.' }
				format.json { render :show, status: :created, location: @member }
			else
				format.html { render :new }
        		format.json { render json: @member.errors, status: :unprocessable_entity }
			end
		end
	end



    def show

    end

    def update

		respond_to do |format|
			if @member.update(member_params)
				format.html { redirect_to @member, notice: 'member was successfully updated.' }
				format.json { render :show, status: :created, location: @member }
			else
				format.html { render :new }
        		format.json { render json: @member.errors, status: :unprocessable_entity }
			end
		end

    end


    def destroy

		if @member.destroy.destroyed?
	      	@member.destroy
    	end  
	    	respond_to do |format|
	      		format.html { redirect_to @member, notice: 'member was successfully destroyed.' }
	      		format.json { head :no_content }
	    	end
    end


    def edit

    end


	
	private 

		def set_member
			@member = Member.find(params[:id])
		end
		def member_params
	      params.require(:member).permit(:name,:emp_code,:member_code, :ainoa_membership_no, :state_code, :mobile_no, :email)
	    end

        def sort_column
	       Member.column_names.include?(params[:sort]) ? params[:sort] : "id"
		end
		  
		def sort_direction
		  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end
end
