class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy]

  # GET /artists
  def index
    @artists = Artist.paginate(:page => params[:page])
    render json: {
      artists: @artists,
      page: @artists.current_page,
      pages: @artists.total_pages,
      total: @artists.total_entries
      }
  end

  def indextop
    @artists = Artist.top_artists(6)
    render json: @artists
  end

  def show
    render json: @artist, serializer: ArtistImagesSerializer
  end

  # POST /artists
  def create
    @artist = Artist.find_or_create_by(artist_params)

    if @artist.save
      render json: @artist, status: :created, location: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artists/1
  def update
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artists/1
  def destroy
    @artist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_params
      params.require(:artist).permit!
      params.require(:page).permit!
    end

    def page
      params[:page] || 1
    end

end
