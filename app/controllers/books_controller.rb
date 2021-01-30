class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:success] = 'You have updated user successfully.'
    redirect_to book_path(@book)
    else
      @books = Book.all
      redirect_to books_path
    end
    # if @book.save
      # flash[:notice] = "You have created book successfully."
      # redirect_to book_path(@book.id)
    # else
      # @books = Book.all
      # render :index
    # end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = current_user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

 def update
   @user = Book.find(params[:id])
  if @user.update(book_params)
    flash[:success] = 'You have updated user successfully.'
   redirect_to book_path(@user)
  else
   render "books/edit"
  end
 end

  def edit
    @user = Book.find(params[:id])
  end

  private
  # ストロングパラメータ
def book_params
  params.require(:book).permit(:title, :body )
end
end
