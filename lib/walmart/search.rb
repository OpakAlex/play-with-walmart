require 'net/http'

module Walmart
  module Search
    extend self

    def find_reviews_by_product_id(product_id)
      uri = URI("http://api.walmartlabs.com/v1/reviews/#{product_id}?format=json&apiKey=#{secret_key}")
      result = Net::HTTP.get(uri)
      JSON.parse(result)
    end

    def match_reviews_by_keyword(reviews, keyword)
      reviews.select do |review|
        (review["name"].present? && review["name"].include?(keyword)) ||
          (review["reviewText"].present? && review["reviewText"].include?(keyword))
      end
    end

    private
    def secret_key
      Rails.application.secrets.walmart_api_key
    end
  end
end
