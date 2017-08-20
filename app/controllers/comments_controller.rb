class CommentsController < ApplicationController
  before_action :find_idea, only: [:index, :new, :show, :create, :edit, :update, :destroy]

  def index
    comments = @idea.comments
    render :index, locals: { idea: @idea, comments: comments }
  end

  def show
    @comments = current_user.comments.find(params[:id])
    render :show, locals: { idea: @idea, comment: @comment }
  end

  def new
    @comment = current_user.comments.new
    render :new, locals: { idea: @idea, comment: @comment }
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to idea_comment_path(@idea, @comment), notice: 'comment was successfully created.'
    else
      render :new, locals: { comment: @comment, idea: @idea }
    end
  end

  def edit
     @comment = Comment.find(params[:id])
    render :edit, locals: { idea: @idea, comment: @comment }
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to idea_comment_path(idea_id = params[:idea_id], @comment), notice: 'comment was successfully updated.'
    else
      render :edit, locals: { idea: @idea, comment: @comments }
    end
  end

  def destroy
     @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to idea_comments_path(idea_id = params[:idea_id]), notice: 'comment was successfully destroyed.'
  end

  private

  def find_idea
    @idea = Idea.find(params[:idea_id])
  rescue ActiveRecord::RecordNotFound
    render "errors/not_found", status: 404
  end

  def comment_params
    new_params = params.permit(:body)
    new_params['idea_id'] = params[:idea_id]
  end
end  