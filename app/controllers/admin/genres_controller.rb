class Admin::GenresController < ApplicationController
  def index
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_item_path(@item)
  end
  
  def edit
  end
  
  def update
  end
  
end
