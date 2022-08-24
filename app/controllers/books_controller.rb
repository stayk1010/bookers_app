class BooksController < ApplicationController

  def index
   @books = Book.all
   @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(title: book_params[:title], body: book_params[:body])
    
   if @book.save
     flash[:notice] ='Book was successfully created.'
     redirect_to book_path(@book) 
   else
     @books = Book.all
     render :index
   end
  end
  
  
  
  
  def update
    @book = Book.find(params[:id])
    @book = @book.update(book_params)
    redirect_to book_path
  end
  
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
