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
    @diver = Diver.find(params[:id])
    if @diver.update_attributes(params[:diver])
      flash[:success] = "Diver was updated"
      redirect_to divers_url
    else
      flash[:failure] = "Diver was NOT updated"
      render 'edit'
    end
  end

  def edit
    @diver = Diver.find(params[:id])
  end

  def index
    @divers = Diver.order("last_name desc")
  end

  def destroy
    @diver = Diver.find(params[:id])
    @diver.destroy
    redirect_to divers_url
  end

end
