class BorrowersController < ApplicationController

    def new
      @comic_book = ComicBook.find(params[:comic_book_id])
      @borrower = Borrower.new
    end

    def create
      @comic_book = ComicBook.find(params[:comic_book_id])
      @borrower_params = params[:borrower]
      @borrower = Borrower.new(borrower: borrower_params[:borrower], body: borrower_params[:body])
  
      if @borrower.save
        redirect_to @borrower
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @comic_book = ComicBook.find(params[:comic_book_id])
      @borrowers = Borrower.find(params[:id])
    end
  
    private
      def borrower_params
        params.require(:borrower).permit(:borrower, :body)
      end
  end
  
