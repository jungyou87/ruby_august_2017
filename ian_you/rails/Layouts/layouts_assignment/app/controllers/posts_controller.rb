class PostsController < ApplicationController
  def index
    flash[:message] ||= []
    @users = User.all
    @posts = Post.all

    @posts.joins(:user)
    
    render layout: 'three_column'
  end

  def create
    flash[:message] = []
    post = Post.create(post_params)      

    if  post.errors.full_messages != [] 
      flash[:message] = post.errors.full_messages
      return redirect_to '/posts/index'
    
    else
      flash[:message] << "Successfully Created"
      return redirect_to '/posts/index'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end
