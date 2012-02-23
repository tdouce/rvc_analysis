class VisitsController < ApplicationController

  before_filter :find_visit, :only => [:edit, :update, :destroy]

  def new
    @visit = Visit.new

    # Build twice because we need two divers for each visit.  This generates
    # collection_select inside field_for twice
    2.times { @visit.diver_visits.build }
  end

  def create
    @visit = Visit.new(params[:visit])
    if @visit.save 
      flash[:succes] = "Visit was created!"
      redirect_to visits_url
    else
      flash[:failure] = "Visit was NOT created!"
      render :action => 'new'
    end
  end

  def update
    if @visit.update_attributes(params[:visit])
      flash[:success] = "Visit was updated"
      redirect_to visits_url
    else
      flash[:failure] = "Visit was NOT updated"
      render 'edit'
    end
  end

  def edit
  end

  def index
    @visits = Visit.all
  end

  def destroy
    @visit.destroy
    redirect_to visits_url
  end

  protected

  def find_visit
    @visit = Visit.find(params[:id])
  end

end
