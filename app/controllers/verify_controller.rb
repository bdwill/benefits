class VerifyController < ApplicationController
  before_filter :require_user

  def index
    @page_title = "Benefits Verification"
  end

  def list_active
    @office = Office.find(params[:id])
    @page_title = "Listing Active Benefits for #{@office.office} Office"
    @benefits = Benefit.paginate :page => params[:page], :conditions => ["office_id = ? and active = ?", params[:id], true], :order => 'date'
    respond_to do |format|
      format.html
      # Ajax pagination
      format.js {
        render :update do |page|
          page.replace 'results', :partial => 'active_results'
        end
      }
    end
  end

  def show
    @benefit = Benefit.find(params[:id], :include => [:office, :comments])
    @page_title = "Detailed Benefit Information :: #{@benefit.patient_Name}"
  end

  def new
    @page_title = "Add Record"
    @benefit = Benefit.new
    @offices = Office.find(:all)
  end

  def create
    @benefit = Benefit.new(params[:benefit])
    if @benefit.save
      flash[:notice] = 'Benefit was successfully created.'
      redirect_to benefits_path
    else
      @page_title = "Add Record"
      @offices = Office.find(:all)
      render 'verify/new'
    end
  end

  def edit
    @benefit = Benefit.find(params[:id])
    @offices = Office.find(:all)
    @page_title = "Edit Benefit Information :: #{@benefit.patient_Name}"
  end

  def update
    @benefit = Benefit.find(params[:id])
    if @benefit.update_attributes(params[:benefit])
      flash[:notice] = 'Benefit was successfully updated.'
      redirect_to benefit_path(@benefit)
    else
      render edit_benefit_path(@benefit)
    end
  end

  def destroy
    Benefit.find(params[:id]).destroy
    respond_to do |format|
      format.html {
        redirect_to benefits_path
      }
      # Ajax request
      format.js {
        render :nothing => true
      }
    end
  end

  def signoff
    benefit = Benefit.find(params[:id])
    if (benefit.user_signoff(@current_user.id))
      flash[:notice] = "The benefit was signed off."
      redirect_to benefits_path
    else
      flash[:error] = "There was a problem signing off on the benefit. Please contact your System Administrator."
      redirect_to benefit_path(benefit)
    end
  end

  def display_comment_form
    @comment = Comment.new
    @benefit = Benefit.find(params[:id])
    render :partial => 'comment_form'
  end

  def create_comment
    # TODO Validation
    @comment = Comment.new
    @comment.benefit_id = params[:id]
    @comment.user_id = @current_user.id
    @comment.comment = params[:comment]
    @comment.save

    # Update comments on page
    @benefit = Benefit.find(params[:id])
    respond_to do |format|
      format.html {
        redirect_to benefit_path(@benefit)
      }
      # Ajax request
      format.js {
        render :update do |page|
          page.replace 'comments', :partial => 'comments'
        end
      }
    end
  end
end
