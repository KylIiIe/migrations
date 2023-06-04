class LibrariesController < ApplicationController
  before_action :set_library, only: %i[show edit update]
  include ActiveStorage::SetCurrent

  def index
    @libraries = LibrariesQuery.main_sort(params)
    @sort_by = params[:sort_by]
    @name = params[:name]
  end

  def show
    @books = @library.books
    @library_cards = @library.library_cards
    @image = @library.image.url
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(name: library_params[:name], year_of_creation: library_params[:year_of_creation], image: library_params[:image])
    if @library.save
      redirect_to @library
    else
      flash.now[:alert] = 'This library already exists!'
      @library = Library.new(name: library_params[:name], year_of_creation: library_params[:year_of_creation], image: library_params[:image])
      render :new
    end
  end

  def edit; end

  def update
    if @library.update(name: library_params[:name], year_of_creation: library_params[:year_of_creation], image: library_params[:image])
      redirect_to @library
    else
      flash.now[:alert] = 'This library already exists!'
      set_library
      render :edit
    end
  end

  def destroy
    Library.delete_library(params[:id])
    redirect_to libraries_path
  end

  private

  def set_library
    @library = Library.find(params[:id])
  end

  def library_params
    params.require(:library).permit(:name, :year_of_creation, :image)
  end
end
