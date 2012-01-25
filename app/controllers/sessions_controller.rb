class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to posts_path, :notice => "Connecté avec succès !"
    else
      flash.now[:alert] = "Utilisateur ou Mot de passe invalide !"
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path, :notice => "Vous êtes bien déconnecté !"
  end
end
