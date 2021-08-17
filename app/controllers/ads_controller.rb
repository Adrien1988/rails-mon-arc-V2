class AdsController < ApplicationController
  before_action :set_ad, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @ads = policy_scope(Ad)
    @markers = @ads.geocoded.map do |ad|
      {
        lat: ad.latitude,
        lng: ad.longitude
      }
    end
  end

  def show
  end

  def new
    @ad = Ad.new
    authorize @ad
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.user = current_user
    authorize @ad
    if @ad.save
      redirect_to ad_path(@ad)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @ad.update(ad_params)
    redirect_to ad_path(@ad)
  end

  def destroy
    @ad.destroy
    redirect_to ads_path
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
    authorize @ad
  end

  def ad_params
    params.require(:ad).permit(:title, :equipment, :price, :state, :description, :address, photos: [])
  end
end
