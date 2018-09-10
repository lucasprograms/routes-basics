class ArtworksController < ApplicationController
    def index
    render json: Artwork.all
  end

  def create
    artwork = Artwork.new(params.require(:artwork).permit(:email, :name))
    
    if artwork.save!
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: Artwork.find(params[:id])
  end

  def update
    artwork = Artwork.update(params[:id], artwork_params)
    if artwork.errors.full_messages.any?
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    else
      render json: artwork
    end
  end

  def destroy
    Artwork.destroy(params[:id])
    render json: Artwork.all
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end