class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
    @title = "Inscription"
    @user = User.new
  end

  def index  
    @title = "Utilisateurs"
    @users = User.all  
  end  
  
  def show  
    @title = current_user.name
    @user = current_user  
  end

  def create
    @title = "Inscription"
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, :notice => "Merci pour votre inscription ! Vous êtes maintenant connecté !"
    else
      render :action => 'new'
    end
  end

  def edit
    @title = current_user.name
    @user = current_user
  end

  def update
    @title = current_user.name
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to posts_path, :notice => "Votre profil a été mis à jour !"
    else
      render :action => 'edit'
    end
  end
end
