class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)

    if comment.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.prepend( "comments", partial: 'posts/comment', locals: {comment: comment} ) }
        format.html { redirect_to post_path(comment.post_id) }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update(comment_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("comment_#{comment.id}", partial: "posts/comment", locals: {comment: comment})}
        format.html { redirect_to post_path(comment.post_id)}
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    respond_to do |format|
      format.turbo_stream {render turbo_stream: turbo_stream.remove(comment)}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end
