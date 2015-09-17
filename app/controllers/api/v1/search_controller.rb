class Api::V1::SearchController < ApplicationController
  before_action :check_product_id!

  def index
    result = Walmart::Search.find_reviews_by_product_id(params[:product_id])
    reviews = result["reviews"]
    unless reviews.present?
      return head 422
    end

    if params[:keyword].present?
      reviews = Walmart::Search.match_reviews_by_keyword(reviews, params[:keyword])
    end

    render json: reviews
  end

  private

  def check_product_id!
    head 422 unless params[:product_id].present?
  end
end
