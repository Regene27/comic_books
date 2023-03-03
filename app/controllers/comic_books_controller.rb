class ComicBooksController < ApplicationController
  def index
    @comic_books = ComicBook.all
  end

  def show
    @comic_book = ComicBook.find(params[:id])
  end

  def new
    @comic_book = ComicBook.new
  end

  def create
    comic_book_params = params[:comic_book]
    comic_book = ComicBook.new(title: comic_book_params[:title], volume: comic_book_params[:volume], publisher: comic_book_params[:publisher])

    if comic_book.save
      redirect_to comic_book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comic_book = ComicBook.find(params[:id])
    render :edit
  end

  def update
    @comic_book = ComicBook.find(params[:id])

    if @comic_book.update(comic_book_params)
      redirect_to @comic_book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comic_book = ComicBook.find(params[:id])
    @comic_book.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def comic_book_params
      params.require(:comic_book).permit(:title, :volume, :publisher)
    end
end
