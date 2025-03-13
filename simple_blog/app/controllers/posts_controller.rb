class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
    redirect_to posts_path, status: :see_other, notice: 'Post was successfully deleted.'
  end

  private

  # Use callbacks to set post
  def set_post
    @post = Post.find(params[:id])  
  end

  # Ensure only the post owner can edit or delete
  def authorize_user!
    redirect_to posts_path, alert: "You don't have permission to do that." unless @post.user == current_user
  end

  # Only allow trusted parameters
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
