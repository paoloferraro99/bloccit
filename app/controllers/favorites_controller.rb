class FavoritesController < ApplicationController
	
	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: @post)
		
		if favorite.save
			flash[:notice] = "You've favorited this post."
			redirect_to [@post.topic, @post]
			# Add code to generate a success flash and redirect to @post
			# Remember the path shortcut: [@post.topic, @post]
			else
			flash[:error] = "There was a problem favoriting the post."
			# Add code to generate a failure flash and redirect to @post
		end
	end
	
	def destroy
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.find(params[:id])
		
		if favorite.destroy
			flash[:notice] = "You've successfully unfavorited this post."
			redirect_to [@post.topic, @post]
			else
			flash[:error] = "There was a problem unfavoriting the post."
		end
	end
	
end
