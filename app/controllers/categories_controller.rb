class CategoriesController < ApplicationController
  before_filter :user_signed_in, except: [:show]

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
    @category_name = @category.name

    render 'posts/index'
  end

  def new
    @category = Category.new
  end

  def create
    binding.pry
    @category = Category.new(category_params[:category])

    if @category.save
      flash[:success] = 'Category was successfully created.'
      redirect_to @category
    else
      render 'new'
    end
  end

  private
  def category_params
    params.permit(category: [:name])
  end
end
