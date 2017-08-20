
require 'pry'
class IdeasController < HomeController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def new
    @idea = Idea.new
  end

  def index
    @ideas = Idea.all
  end

  def show
    render :show, locals: { idea: @idea }
  end

  def create
# binding.pry
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to idea_path(@idea), notice: 'idea was successfully created.'
    else
      render :new, locals: { idea: @idea }
    end
  end

  def edit
    render :edit, locals: { idea: @idea }
  end

  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'idea was successfully updated.'
    else
      render :edit, locals: { idea: @idea }
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: 'idea was successfully destroyed.'
  end

private

  def find_idea
    # binding.pry
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:id, :title, :summary, :votes, :collaborators)
  end
end

