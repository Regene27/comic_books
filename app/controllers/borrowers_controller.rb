class BorrowersController < ApplicationController
    def create
      @comic_books = ComicBook.find(params[:comic_books_id])
      @borrower = @comic_books.borrowers.create(borrower_params)
      redirect_to comic_books_path(@comic_books)
    end
  
    private
      def borrower_params
        params.require(:borrower).permit(:borrower, :body)
      end
  end
  
