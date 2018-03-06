class ArtworksController < ApplicationController
  def index
    render json: Artwork
    .joins(:shares)
    .where("artist_id = ? or artwork_shares.viewer_id = ?", params[:user_id], params[:user_id])
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    render json: artwork
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render text: 'Artwork Destroyed'
  end



private

  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end
end
