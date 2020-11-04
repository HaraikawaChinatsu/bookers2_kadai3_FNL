class FavoritesController < ApplicationController

  # before_action :authenticate_user!

  def create
    @user = current_user
    book = Book.find(params[:book_id])
    return if book.favorites.find_by(user_id: book.user.id)
    # この一行を追加
    # favorite = @user.favorites.new(book_id: book.id)
    favorite = Favorite.create(user_id: book.user.id, book_id: book.id)
    favorite.save
    redirect_to books_path
  end

  def destroy
    @user = current_user
    book = Book.find(params[:book_id])
    favorite = Favorite.create(user_id: book.user.id, book_id: book.id)
    # favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to books_path(book)
  end

end
