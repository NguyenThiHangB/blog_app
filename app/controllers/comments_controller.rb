class CommentsController < ApplicationController
  before_action :logged_in_user, only: %i(create edit update destroy)
  before_action :find_entry, only: %i(new create edit update destroy)
  before_action :find_comment, only: %i(edit update destroy)

  def create
    @comment = Comment.new comment_params
    @comments = @entry.comments.all
    @comment.save
    respond_to do |format|
      format.html { redirect_to @comments.entry }
      format.js
    end
  end


  def edit

  end

  def update

  end

  def destroy
  end


  private

  def comment_params
    params.require(:comment).permit :id, :user_id, :entry_id, :content
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
  end

  def find_entry
    @entry = Entry.find_by id: params[:comment][:entry_id]
  end
end
