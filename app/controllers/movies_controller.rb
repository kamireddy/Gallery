class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def search
    if params[:search].present?
      @image = Movie.search(params[:search])
    else
      @image = Movie.all
    end
  end

  def index
    @image = Movie.all
  end

  def show    
  end

  def new
    @image = current_user.movies.build
  end

  def edit
  end

  def create
    @image = current_user.movies.build(movie_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @image.update(movie_params)
        format.html { redirect_to @image }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  private
    def set_movie
      @image = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :image)
    end
end
