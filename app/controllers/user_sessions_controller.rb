class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def index
    new
  end
  
  def new
    @page_title = "Benefits Verification Login"
    @user_session = UserSession.new
  end

  def create
    @page_title = "Benefits Verification Login"
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to :controller => 'verify', :action => 'index'
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "You have been logged out."
    redirect_to :controller => 'user_sessions', :action => 'new'
  end
end
