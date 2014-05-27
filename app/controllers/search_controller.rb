class SearchController < ApplicationController
    before_filter :require_user
    
    def index 
      @page_title = "Benefits Verification Search"
      
      if (request.post?)
        session[:search_query] = ""
        session[:search_params] = Hash.new
        unless (params[:patient_Name].blank?)
          session[:search_params][:patient_Name] = "%#{params[:patient_Name]}%"
          session[:search_query] += "patient_Name like :patient_Name"
        end
        unless (params[:date]['(1i)'].blank? or params[:date]['(2i)'].blank? or params[:date]['(3i)'].blank?)
          date = Date.civil(params[:date][:"(1i)"].to_i,params[:date][:"(2i)"].to_i,params[:date][:"(3i)"].to_i)
          session[:search_params][:date] = date.strftime("%Y-%m-%d")
          unless (session[:search_query].blank?) then session[:search_query] += " AND " end
          session[:search_query] += "date = :date"
        end
      end
      
      if (request.post? or params[:page])
        @benefits = Benefit.paginate :page => params[:page], :conditions => [session[:search_query], session[:search_params]], :order => 'date', :include => :office
      end
      
      respond_to do |format|
        format.html
        # Ajax search results
        format.js {
          render :update do |page|
            page.replace 'results', :partial => 'search_results'
          end
        }
      end
    end
end
