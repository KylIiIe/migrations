class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit]

  def index
    @books = Book.all
  end

  def new
    set_new_book
  end

  def create
    @book = Book.add_book(book_params[:name], book_params[:year], book_params[:library_id],
                          book_params[:author_ids], book_params[:genre_ids])
    if @book
      redirect_to @book
    else
      flash.now[:alert] = 'All fields must be filled!'
      set_new_book
      render :new
    end
  end

  def show
    @genres = @book.genres
    @authors = @book.authors
  end

  def edit
    @libraries = Library.all
  end

  def update
    @book = Book.update_book(book_params[:name], book_params[:year], book_params[:library_id],
                              book_params[:author_ids], book_params[:genre_ids], params[:id])
    if @book
      redirect_to @book
    else
      flash.now[:alert] = 'All fields must be filled!'
      set_book
      @libraries = Library.all
      render :edit
    end
  end

  def destroy
    Book.delete_book(params[:id])
    redirect_to books_path
  end

  private

  def set_new_book
    @book = Book.new
    @library_cards = LibraryCard.all
    @libraries = Library.all
    @genres = Genre.all
    @authors = Author.all
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :year, :library_id, :library_card_id, author_ids: [], genre_ids: [])
  end
end
