class PostsController < ApplicationController
    
  def show
 #   @summary = Summary.find(params[:topic_id])
  	@topic = Topic.find(params[:topic_id])
  
    @post = Post.find(params[:id])
    if @post.summary.blank?
      @summary = @post.build_summary
      @summary.save
    else
      @summary = @post.summary
    end
  end

  def new
 #   @summary = Summary.find(params[:topic_id])
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
      authorize @post
  end
       
  def edit
 #   @summary = Summary.find(params[:topic_id])
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
        authorize @post 
  end
  
       def create
  #        @summary = Summary.find(params[:topic_id])
     @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post.topic = @topic     
  #  @post.summary = @summary     
    authorize @post

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
 #    @summary = Summary.find(params[:topic_id])
     @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end


end