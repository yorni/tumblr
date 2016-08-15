class CommentsController < ApplicationController

before_action :find_post, only: [:create, :destroy] 


def create
	@comment = @post.comments.create(comment_params)
	redirect_to_post
end



def destroy
	@comment = @post.comments.find(params[:id])
	@comment.destroy
	redirect_to_post
end


private 

def redirect_to_post
	redirect_to post_path(@post)
end


def comment_params
	params.require(:comment).permit(:name, :body)
end

def find_post
	@post = Post.find(params[:post_id])
end


end
