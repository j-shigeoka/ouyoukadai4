class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = book_comments.new(book_comments_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_to request.referer
  end
  
  def destroy
    Book_comment.find_by(id: params[:id], book_id: params[:book_id])
    redirect_to request.referer
  end
  
  private
  
  def book_comments_params
    params.require(:book_commnent).permit(:comment)
end
