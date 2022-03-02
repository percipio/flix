class ReviewsController < ApplicationController
  before_action :require_signin, except: [:index]
  before_action :set_movie
  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to movie_reviews_path(@movie),
                    notice: "Thanks for your review!"
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to movie_reviews_path(@movie),
              notice: "Review updated"
    else
      render :edit
    end
  end

  def edit
  end
  
  def destroy
    if @review.destroy
      redirect_to movie_reviews_path(@movie),
                  notice: "Review deleted"
    else
      redirect_to movie_reviews_path(@movie),
                  alert: "Review not deleted"
    end
  end

private

  def review_params
    params.require(:review).permit(:comment, :stars)
  end

  def set_review
    @review = @movie.reviews.find(params[:id])
  end

  def set_movie
    @movie = Movie.find_by(slug: params[:movie_id])
  end

end
