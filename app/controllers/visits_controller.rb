class VisitsController < ApplicationController

  def new
    @visit = Visit.new
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

  end

  def edit
  end

  def index
    @visits = Visit.all
  end

end
