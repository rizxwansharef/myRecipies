class CommentsController < ApplicationController
  before_action :require_login
  before_action :set_recipe
  before_action :set_comment, only: :destroy
  before_action :require_admin, only: :destroy

  def create
    @comment = @recipe.comments.build(comment_params)
    @comment.chef = current_chef

    if @comment.save
      redirect_to @recipe, notice: "Comment was successfully added."
    else
      @recipe = Recipe.includes(:chef, :ingredients, comments: :chef).find(@recipe.id)
      render "recipes/show", status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to @recipe, notice: "Comment was successfully deleted."
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_comment
    @comment = @recipe.comments.find(params[:id])
  end

  def require_admin
    return if authorized_for_admin?

    redirect_to @recipe, alert: "You are not authorized to perform this action."
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
