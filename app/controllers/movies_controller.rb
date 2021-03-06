class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

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
      @movie = Movie.new(movie_params)
      @movie.user = current_user
      if @movie.save
        flash[:notice] = 'Movie Added successfully'
        redirect_to @movie
      else
        render 'new'
      end
    end

    def update
      if @movie.update(movie_params)
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

    def movie_params
      params.require(:movie).permit(:name, :description, category_ids: [])
    end

    def require_same_user
      if current_user != @movie.user && !current_user.admin?
        flash[:alert] = "You are not authorised to perform this action"
        redirect_to @movie
      end
    end
end