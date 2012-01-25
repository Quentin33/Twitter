class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
    @user = User.new
  end

  def index  
    @users = User.all  
  end  
  
  def show  
    @user = current_user  
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, :notice => "Merci pour votre inscription ! Vous êtes maintenant connecté !"
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to posts_path, :notice => "Votre profil a été mis à jour !"
    else
      render :action => 'edit'
    end
  end
end
