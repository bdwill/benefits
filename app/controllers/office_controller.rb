class OfficeController < ApplicationController
#  before_filter :require_user
  
  def index
    @offices = Office.find(:all)
  end

  def show
    @office = Office.find(params[:id])
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(params[:office])
    if @office.save
      flash[:notice] = 'Office was successfully created.'
      redirect_to offices_path
    else
      render new_office_path
    end
  end

  def edit
    @office = Office.find(params[:id])
  end

  def update
    @office = Office.find(params[:id])
    if @office.update_attributes(params[:office])
      flash[:notice] = 'Office was successfully updated.'
      redirect_to office_path(@office)
    else
      render :action => 'edit'
    end
  end

  def destroy
    Office.find(params[:id]).destroy
    redirect_to offices_path
  end
end
