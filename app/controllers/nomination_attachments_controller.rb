class NominationAttachmentsController < ApplicationController

	def index

			@nomination_attachment = NominationAttachment.new
			set_nomination
			@nomination_attachment.nomination = @nomination
			if @nomination
		      @nomination_attachment.registration_no = @nomination.registration_no
		    end
			if params.has_key?(:nomination_attachment)
				@nomination = Nomination.find_by registration_no: nomination_attachments_params[:registration_no]
				
				if nomination_attachments_params.has_key?(:attachment)
					@nomination_attachment= NominationAttachment.new 
					@nomination_attachment.attachment = nomination_attachments_params[:attachment]
					@nomination_attachment.nomination = @nomination
					@nomination_attachment.registration_no = @nomination.registration_no
				    respond_to do |format|
			
	                    if @nomination_attachment.save
		                 format.html { redirect_to @nomination_attachment, notice: 'Nomination copy is successfully attached.' }

		                else
		                 format.html { render :index }
                   end
               end
		      end
			end
	end


	def attach

	end
    
    def show
		set_nomination_attachment
		    	
    end

	private

		def set_nomination_attachment
			@nomination_attachment = NominationAttachment.find(params[:id])
		end
		def set_nomination
			if params.has_key?(:nomination_attachment)
				@nomination = Nomination.find_by registration_no: nomination_attachments_params[:registration_no]
			end
		end

		def nomination_attachments_params
	      		params.require(:nomination_attachment).permit(:registration_no,:attachment)

	    end

end
