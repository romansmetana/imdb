# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: %i[edit update show destroy]
  def index
    @pagy, @movies = if params[:category]
                pagy(Movie.where(category: params[:category]))
              else
                pagy(Movie.all)
              end
    @rating = Rating.create
  end

  def show
    authorize Movie
  end

  def new
    authorize Movie
    @movie = Movie.new
  end

  def create
    authorize Movie
    @movie = Movie.new(movie_params)
    if @movie.save
      flash = 'The movie was successfully created'
      redirect_to root_path
    else
      flash = 'Something wrong..'
      redirect_to 'new'
    end
  end

  def edit
    authorize @movie
  end

  def update
    authorize @movie
    if @movie.update(movie_params)
      flash = 'Movie was successfuly updated'
      redirect_to root_path
    else
      flash = 'Something wrong..'
      redirect_to 'edit'
    end
  end

  def destroy
    authorize @movie
    return flash = 'Movie was successfuly destroy' if @movie.destroy

    redirect_back(fallback_location: root_path)
    'Something wrong..'
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :category)
  end
end
