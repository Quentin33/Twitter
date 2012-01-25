class PostsController < ApplicationController

	def index  
		#on trie les twits par date de création
    	@posts = Post.all(:order => "created_at DESC")  
	    respond_to do |format|  
	      format.html  
	    end  
  	end

	def create  
	    @post = Post.create(:twit => params[:twit], :user_id => session[:user_id])  
	    respond_to do |format|  
	      if @post.save  
	        format.html { redirect_to posts_path }  
	      else  
	        flash[:notice] = "Twit failed to save."  
	        format.html { redirect_to posts_path }  
	      end  
	    end  
  	end 

end
