class BooksController < ApplicationController
  def show
    service = Items::GetBookService.new
    @book = service.fetchBook(params[:id])
    render json: @book
  end

  def index
    service = Items::GetBookService.new
    @books = service.fetchBooks
    render json: @books
  end
  
end
