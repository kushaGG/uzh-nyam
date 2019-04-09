class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_catalog
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    params[:review][:user_id] = current_user.id
    params[:review][:catalog_id] = @catalog.id
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to catalog_path(@catalog.id)
    else
      render 'new'
    end
  end

  def edit
    #code
  end

  def update
    if @review.update(review_params)
      redirect_to catalog_path(@catalog)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to catalog_path(@catalog)
  end

  private
  def find_catalog
    @catalog = Catalog.find(params[:catalog_id])
  end

  def find_review
    @review = Review.find_by(id: params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :catalog_id, :comment, :rating, {photos: []})
  end
end
