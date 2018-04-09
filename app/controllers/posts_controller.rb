class PostsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(sort_column + " " + sort_direction).all.paginate(page: params[:page], per_page: Rails.application.config.records_per_page)
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end



  def show

  end

  def update

  respond_to do |format|
    if @post.update(post_params)
      format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      format.json { render :show, status: :created, location: @post }
    else
      format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end

  end


  def destroy

  if @post.destroy.destroyed?
        @post.destroy
    end  
      respond_to do |format|
          format.html { redirect_to @post, notice: 'Post was successfully destroyed.' }
          format.json { head :no_content }
      end
  end


  def edit

  end


  
  private 
     def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:name, :deleted, :election_type_id,:sort_order)
    end

    def sort_column
         Election.column_names.include?(params[:sort]) ? params[:sort] : "sort_order"
    end
      
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end

