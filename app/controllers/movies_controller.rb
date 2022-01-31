class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
      @movies = Movie.paginate(page: params[:page], per_page: 3)
    end

    def new
      @movie = Movie.new
    end

    def edit
    end

    def create
      @movie = Movie.new(params.require(:movie).permit(:name, :genre))
      @movie.user = User.first
      if @movie.save
        flash[:notice] = 'Movie Added successfully'
        redirect_to @movie
      else
        render 'new'
      end
    end

    def update
      if @movie.update(params.require(:movie).permit(:name, :genre))
        flash[:notice] = "Movie info updated"
        redirect_to @movie
      else
        render 'edit'
      end
    end

    def destroy
      @movie.destroy
      redirect_to movies_path
    end

    private 

    def set_movie
      @movie = Movie.find(params[:id])
    end
end