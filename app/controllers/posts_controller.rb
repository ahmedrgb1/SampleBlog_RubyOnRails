class PostsController < ApplicationController
	
	http_basic_authenticate_with name: "ahmed", password:"P@$$w0rd", except: [:index, :show]


	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id]) #get this single post based on its id 
	end

	def new
		@post = Post.new
	end

	def create
		#render plain: params[:post].inspect
		@post = Post.new(post_params)
		if(@post.save)
		#to open the view for the saved post 
			redirect_to @post
		else
			render 'new'
		end
	end
	
	def edit 
		@post = Post.find(params[:id])
	end

	def update 
		@post = Post.find(params[:id])
		if(@post.update(post_params))
		#to open the view for the saved post 
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end 

	private def post_params 
		#to allow the databased to receive these certain parameters
		params.require(:post).permit(:title, :body)
	end
end