class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if Post.new(post_params).valid?
      @post.update(post_params) #if newly updated post is valid, update post
      redirect_to post_path(@post) #then redirect to post page 
    else
      render :edit #takes them back to edit page(in edit file of post folder) and have them re edit if post is invalid
    # @post.update(post_params)
    #
    # redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
