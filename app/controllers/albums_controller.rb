class AlbumsController < ApplicationController #note the naming convention of AlbumsController. This needs to be pluralized and upper camelcase. AlbumsController inherits from ApplicationController which in turn inherits from ActionController::Base

  def index
    @albums = Albums.all
    render :index # We use the render method to treytutrn tyhe corresponding view.
  end

  def new #first instantiates a new Album and stores it in an instance variable called @album.
   @album = Album.new 
   render :new
  end

  def create
    @album = Album.new(album_params) #albums_params is from the form.
    if @album.save # REMEMBER save returns a boolean while create returns the created record.
      redirect_to albums_path #  We combine the prefix 'albums' with _path. albums corresponds to the index route of our AlbumsController so the code inside def index will run.
    else
      render :new #this will just take us back to new.
    end
  end

  def edit #REMEMBER - We use find to connect the correct album to the edit form. This is not a POST.
    @album = Album.find(params[:id]) #Rails has a params hash just like Sinatra. 
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
   @album = Album.find(params[:id])
   if @album.update(album_params)
    redirect_to albums_path #the index route
    render :edit
   end
  end

  def destroy
   @album = Album.find(params[:id])
   @album.destroy
   redirect_to albums_path
  end 

  private #Private methods are available only inside the class. That means any methods included under private will only be available inside the AlbumsController class.
    def album_params #This is the same album_params we've passed into our create action. 
      params.require(:album).permit(:name, :genre) #name and genre are the only parameters to be passed into an album. :album is the class
    end

end