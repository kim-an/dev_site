class CampaignsController < ApplicationController

  def index
    @campaigns = current_user.campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
    @client   = @campaign.client
    @ads      = @campaign.ads
  end

  def new
    @client   = Client.find(params[:client_id]) #current_user
    @campaign = @client.campaigns.new #make new campaign
    @ad       = @campaign.ads.new #make new ad
  end

  def create
    @client   = Client.find(params[:client_id])
    @campaign = @client.campaigns.new(campaign_params)
    if @campaign.save
      redirect_to client_path(params[:client_id])
    else
      render 'new'
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      redirect_to client_path(@campaign.client_id)
    else
      render 'edit'
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to campaigns_path
  end

private
  def campaign_params
    params.require(:campaign).permit(:campaign_name, :launch_date)

  end



end
