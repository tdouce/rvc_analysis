class DiversController < ApplicationController

  def new
    @diver = Diver.new
  end

  def create
    @diver = Diver.new(params[:diver])
    if @diver.save
      flash[:success] = "Diver was created!"
      redirect_to divers_url
    else
      flash[:failure] = "Diver was NOT created!"
      render :action => 'new'
    end
  end

  def update
  end

  def edit
  end

  def index
    @divers = Diver.order("last_name desc")
  end

end
