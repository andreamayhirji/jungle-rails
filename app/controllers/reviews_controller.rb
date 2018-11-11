class ReviewsController < ApplicationController

    before_action :require_login
  
    def create
      @review = Review.new("description": params[:review][:description],
                           "product_id": params[:product_id],
                           "rating": params[:review][:rating],
                           "user_id": session[:user_id])
      @review.save!
  
      if @review.save
        redirect_to @review.product
      end
    end
  
    private
    def require_login
      unless session[:user_id]
        flash[:error] = "You must be logged in for access."
        redirect_to new_login_url 
      end
    end
end