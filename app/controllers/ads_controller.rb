class AdsController < ApplicationController

  def index
    @ads = Ad.all
  end

  def new
    @campaign  = Campaign.find(params[:campaign_id]) #current campaign
    @ad        = @campaign.ads.new #create new ad
  end

  def create
    @campaign  = Campaign.find(params[:campaign_id]) #current campaign
    @ad        = @campaign.ads.new(ads_params)
    if @ad.save
      redirect_to campaign_path(params[:campaign_id])
    else
      render 'new'
    end
  end

  def edit
    @ad        = Ad.find(params[:ad_id])
  end

  def show
    @ad        = Ad.find(params[:id])
    @campaign  = @ad.campaign
    @client    = @ad.campaign.client
  end

  def destroy
    @ad        = Ad.find(params[:id])
    @ad.destroy
    redirect_to camapaign_ads_path
  end

private
  def ads_params
    params.require(:ad).permit(:html_file, :width, :height, :image)

  end

end


