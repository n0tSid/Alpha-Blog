class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def show
    @category = Category.find(params[:id])
    @movies = @category.movies.paginate(page: params[:page], per_page: 3)
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 3)
  end

  def new
    @category = Category.new
  end

  def create 
    @category = Category.new( category_params )
    if @category.save
      flash[:notice] = "Category was successfully saved"
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category name updated successfully"
      redirect_to @category
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "You are not authorised to perform this action"
      redirect_to categories_path
    end
  end
end