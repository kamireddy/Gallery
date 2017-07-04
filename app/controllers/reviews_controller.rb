class ReviewsController < ApplicationController
  
  before_action :set_movie
  before_action :authenticate_user!

  def new
    
  end

  def edit
  end

  def create
    
  end

  def update
    
  end

  def destroy
    
  end

  private
    

    def set_movie
      @image = Movie.find(params[:movie_id])
    end

    
end
