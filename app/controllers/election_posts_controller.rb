class ElectionPostsController < ApplicationController

  helper_method :sort_column, :sort_direction
  before_action :set_election
  before_action :set_election_post, only: [:show, :edit, :update, :destroy]

  # GET /elections
  def index
    @election_posts = @election.election_posts.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: Rails.application.config.records_per_page)
  end
  # GET /elections/1
  def show
  end

  # GET /elections/new
  def new
    @election_post = ElectionPost.new
    @election_post.election = @election
  end

  # GET /elections/1/edit
  def edit
  end

  # POST /elections

  def create
    @election_post = ElectionPost.new(election_post_params)
    @election_post.election=@election

    respond_to do |format|
      if @election_post.save
        format.html { redirect_to [@election,@election_post], notice: 'Election Post was successfully created.' }
        format.json { render :show, status: :created, location: [@election,@election_post] }
      else
        format.html { render :new }
        format.json { render json: @election_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elections/1
  def update
    @election_post.election=@election
    respond_to do |format|
      if @election_post.update(election_post_params)
        format.html { redirect_to [@election,@election_post], notice: 'Election Post was successfully updated.' }
        format.json { render :show, status: :created, location: [@election,@election_post] }
      else
        format.html { render :edit }
        format.json { render json: @election_post.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /elections/1
  def destroy
    
    if @election_post.destroy.destroyed?
         @election_post.destroy
    end  
    respond_to do |format|
        format.html { redirect_to [@election,@election_post], notice: 'Election Post was successfully destroyed.' }
        format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_election
      @election = Election.find(params[:election_id])
    end
    
    def set_election_post
      @election_post = ElectionPost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def election_post_params
      params.require(:election_post).permit(:election_id, :post_id, :no_of_post, :sort_order, :deleted, :state_id)
    end

    def sort_column
         ElectionPost.column_names.include?(params[:sort]) ? params[:sort] : "sort_order"
    end
      
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end


