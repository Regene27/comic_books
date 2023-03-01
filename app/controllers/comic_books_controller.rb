class ComicBooksController < ApplicationController
  def index
    @comic_books = ComicBook.all
  end

  def show
    @comic_books = ComicBook.find(params[:id])
  end

  def new
    @comic_books = ComicBook.new
  end

  def create
    comic_book_params = params[:comic_book]
    comic_books = ComicBook.new(title: comic_book_params[:title], volume: comic_book_params[:volume], publisher: comic_book_params[:publisher])

    if comic_books.save
      redirect_to comic_books
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comic_books = ComicBook.find(params[:id])
  end

  def update
    @comic_books = ComicBook.find(params[:id])

    if @comic_books.update(comic_books_params)
      redirect_to @comic_books
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comic_books = ComicBook.find(params[:id])
    @comic_books.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def comic_books_params
      params.require(:comic_books).permit(:title, :volume, :publisher)
    end
end
