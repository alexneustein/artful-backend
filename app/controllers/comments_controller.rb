class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy, :addlike, :unlike]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.find_or_create_by(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def addlike
    @comment.likes = @comment.likes + 1
    @comment.save
  end

  def unlike
    @comment.likes = @comment.likes - 1
    @comment.save
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit!
    end


end
