class SitesController < ApplicationController
  def new
    @site = Site.new
  end

  def create
    @site = Site.new(params[:site])
    if @site.save
      flash[:sucess] = "Site was created!"
      redirect_to sites_url
    else
      flash[:failure] = "Site was NOT created!"
      render :action => 'new'
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params[:site])
      flash[:success] = "Site was updated"
      redirect_to sites_url
    else
      flash[:failure] = "Site was NOT updated"
      render 'edit'
    end
  end

  def index
    @sites = Site.order("name desc")
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_url
  end

end
