class MoviesController < ActionController::Base
    
    def index
       @movies = Movie.all     
    end
    def edit
        @movie = Movie.find params[:id]
    end
    def update
        @movie = Movie.find params[:id]
        @movie.update_attributes(movie_params)
        flash[:notice] = "#{@movie.title} was successfully updated."
        redirect_to movie_path(@movie)
    end
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted."
        redirect_to movies_path
    end
    def create
        
        debugger
        @movie = Movie.create(movie_params)
        #@movie.title = params[:movie][:title]
        #@movie.rating = params[:movie][:rating]
        #@movie.release_date = params[:movie][:release_date]
        #@movie.save!
        flash[:notice] = "#{@movie.title} was successfully created."
        redirect_to movies_path
    end
    def show
        id = params[:id]
        @movie = Movie.find(id)
    end 
    def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end