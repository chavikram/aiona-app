class NominationsController < ApplicationController
  	
  	helper_method :sort_column, :sort_direction
	before_action :set_nomination,  only: [:show, :edit, :update, :destroy]

    def index
    	@nominations = Nomination.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: Rails.application.config.records_per_page)
    end

    def edit
    end
    

    def show
          respond_to do |format|
          format.html

          format.pdf do
            render :pdf => "Nomination Form",
                   :template => 'nominations/show.pdf.haml',
                   #:layout => 'vip_references/pdflayout.pdf.haml',
                    :page_size => 'A4',
                    :footer=>{
                       :center => "AINOA Election Application ",
                      :left => "#{l Time.now}",
                      :right => "Developed by Vikram Singh-Sc-B,NIC",
                      :font_size=>10,
                    },
                   :margin => {:top=>5,:bottom=>10}
          end         
      end
    end	

    
	def new
		@nomination = Nomination.new		
		@nomination.build_candidate
		@nomination.build_proposer
		@nomination.seconders.build
		@nomination.seconders.build
	end

    def destroy
		if @nomination.destroy.destroyed?
	      	@nomination.destroy
    	end  
    	respond_to do |format|
      		format.html { redirect_to @nomination, notice: 'nomination was successfully destroyed.' }
      		format.json { head :no_content }
    	end
    end

	def create
	    @nomination=Nomination.new(nomination_params)
	    @nomination.registration_no = rand(10 ** 8)
	    respond_to do |format|
	      if @nomination.save
	        format.html { redirect_to @nomination, notice: 'Nomination was successfully created.' }
	        format.json { render :show, status: :created, location: @nomination }
	      else
	        format.html { render :new }
	            format.json { render json: @nomination.errors, status: :unprocessable_entity }
	      end
	    end
  	end


  	def update
  		@nomination.avatar = params[:file]

	    respond_to do |format|
	      if @nomination.update(nomination_params)
	        format.html { redirect_to @nomination, notice: 'Nomination was successfully updated.' }
	        format.json { render :show, status: :created, location: @nomination }
	      else
	        format.html { render :new }
	            format.json { render json: @nomination.errors, status: :unprocessable_entity }
	      end

	    end
  	
  	end
  	def update_states
  		@states = State.joins(:election_posts).uniq.where("election_posts.election_id = ?",params[:election_id])
		respond_to do |format|
	      format.js
	    end

  	end

  	def update_posts

	    @election_posts=ElectionPost.where("election_id= ? and state_id= ?",params[:election_id],params[:state_id])

	    respond_to do |format|
	      format.js
	    end

	 end

	private

		def set_nomination
			@nomination = Nomination.find(params[:id])
		end

		def nomination_params
	      params.require(:nomination).permit(:state_id,:election_id,:election_post_id,:accept_flag,:candidate_attributes=>[:honorific_id,:first_name,:middle_name,:last_name,
	      		:designation_id,:avatar,:file,:emp_code, :place_of_posting,:office_address1,:ainoa_membership_no,
	      		:mobile_no,:superannuation_date,:office_tel_no,:res_tel_no,:email],
	      		:proposer_attributes=>[:honorific_id,:first_name,:middle_name,:last_name,
	      		:designation_id,:emp_code, :place_of_posting,:office_address1,:ainoa_membership_no,
	      		:mobile_no],:seconders_attributes=>[:honorific_id,:first_name,:middle_name,:last_name,
	      		:designation_id,:emp_code, :place_of_posting,:office_address1,:ainoa_membership_no,
	      		:mobile_no])

	    end

	    def sort_column
	       Nomination.column_names.include?(params[:sort]) ? params[:sort] : "id"
		end
		  
		def sort_direction
		  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end

end

