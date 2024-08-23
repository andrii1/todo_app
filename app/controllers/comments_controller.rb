class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @task = Task.find(params[:task_id])
    @comment.task = @task
    @comment.user = current_user
    if @comment.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
