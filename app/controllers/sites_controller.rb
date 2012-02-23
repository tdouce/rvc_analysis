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
  end

  def update
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
