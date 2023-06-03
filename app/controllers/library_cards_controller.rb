class LibraryCardsController < ApplicationController
  before_action :set_library_card, only: %i[show edit]

  def index
    @library_cards = LibraryCard.all
  end

  def show; end

  def new
    @libraries = Library.all
    @users = User.all
    @library_card = LibraryCard.new
  end

  def create
    @library_card = LibraryCard.add_library_card(library_card_params[:user_id], library_card_params[:library_id])
    if @library_card
      redirect_to @library_card
    else
      flash.now[:alert] = 'This library_card already exists!'
      @library_card = LibraryCard.new
      @users = User.all
      @libraries = Library.all
      render :new
    end
  end

  def edit
    @users = User.all
    @libraries = Library.all
  end

  def update
    @library_card = LibraryCard.update_library_card(library_card_params[:user_id], library_card_params[:library_id],
                                                 params[:id])
    if @library_card
      redirect_to @library_card
    else
      flash.now[:alert] = 'This library_card already exists!'
      set_library_card
      @users = User.all
      @libraries = Library.all
      render :edit
    end
  end

  def destroy
    LibraryCard.delete_library_card(params[:id])
    redirect_to library_cards_path
  end

  private

  def library_card_params
    params.require(:library_card).permit(:user_id, :library_id)
  end

  def set_library_card
    @library_card = LibraryCard.find(params[:id])
  end
end
