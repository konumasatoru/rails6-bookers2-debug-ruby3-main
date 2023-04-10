class PostCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    @comment = current_user.comments.new(comment_params)
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = book.id
    comment.save
    render :post_comments #render先にjsファイルを指定
  end

  def destroy
    PostComment.find(params[:id]).destroy
    #renderしたときに@postのデータがないので@postを定義
    @book = Book.find(params[:book_id])
    render :post_comments  #render先にjsファイルを指定
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
