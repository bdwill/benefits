class UsersController < ApplicationController
  before_filter :require_user

  def index
    @page_title = "Listing Users"
    @users = User.find(:all)
  end
  
  def new
    @page_title = "New User"
    @user = User.new
  end

  def create
    @page_title = "New User"
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "The user was created."
      redirect_back_or_default users_path
    else
      render :action => :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @page_title = "Edit User :: #{@user.name}"
  end

  def update
    @user = User.find(params[:id])
    @page_title = "Edit User :: #{@user.name}"
    if @user.update_attributes(params[:user])
      flash[:notice] = "The user was updated."
      redirect_to users_path
    else
      render :action => :edit
    end
  end
end
