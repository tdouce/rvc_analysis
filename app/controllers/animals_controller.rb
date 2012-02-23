class AnimalsController < ApplicationController
  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(params[:animal])
    if @diver.save
      flash[:success] = "Species was created!"
      redirect_to animals_url
    else
      flash[:failure] = "Species was NOT created!"
      render :action => 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

end
