class FriendshipsController < ApplicationController  
  def create  
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])  
    if @friendship.save  
      flash[:notice] = "Amis ajouté."  
      redirect_to posts_path  
    else  
      flash[:error] = "Erreur lors de l'ajout."  
      redirect_to posts_path  
    end  
  end  
  
  def destroy  
    @friendship = current_user.friendships.find(params[:id])  
    @friendship.destroy  
    flash[:notice] = "Vous n'êtes maintenant plus amis !"  
    redirect_to posts_path  
  end  
end 