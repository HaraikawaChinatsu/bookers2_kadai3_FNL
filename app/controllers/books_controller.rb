class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @book_comment = BookComment.new
  end

  def index
    @books = Book.all
    # @books = Book.page(params[:page]).reverse_order
    @book = Book.new
    # @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    # @user = current_user
    @book.user_id = current_user.id

  if @book.save
    flash[:success] = "successfully"
    redirect_to book_path(@book.id)

  else
    @books = Book.all
    render :index

  end
  end

  def edit
    @book = Book.find(params[:id])
    unless current_user.id == @book.user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book.id)
      # , notice: "You have updated book successfully."
    else
      flash.now[:danger] = "error"
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destoy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end