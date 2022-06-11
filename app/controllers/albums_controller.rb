class AlbumsController < ApplicationController
  before_action :require_login

  # GET /albums or /albums.json
  def index
    @user = User.find(params[:user_id])
    if @user == current_user
      @albums = @user.albums 
    else
      redirect_to root_path    
    end
  end

  # GET /albums/1 or /albums/1.json
  def show
    @album = Album.find_by(id: params[:id])
  end

  # GET /albums/new
  def new
    @album = Album.new
    @album.user = current_user
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find_by(id: params[:id])
  end

  # POST /albums or /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save 
        format.html { redirect_to user_albums_path(@album.user), notice: "Album was successfully created." }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1 or /albums/1.json
  def update
    @album = Album.find_by(id: params[:id])
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: "Album was successfully updated." }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1 or /albums/1.json
  def destroy
    @album = set_album
    @album.images.purge 
    respond_to do |format|
      if @album.destroy 
        format.html { redirect_to user_albums_path(@album.user), notice: "Album was successfully deleted." }          
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # Custom action for deleting single images
  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to user_albums_path(current_user)
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:title, :user_id, images: [])
    end
end
