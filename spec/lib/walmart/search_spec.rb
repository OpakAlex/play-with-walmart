require 'rails_helper'

describe Walmart::Search do
  context "#find_reviews_by_product_id" do
    it "returns reviews by product id" do
      result = described_class.find_reviews_by_product_id 40712755
      expect(result["reviews"]).not_to be_nil
    end

    it "returns nil if product id wrong" do
      result = described_class.find_reviews_by_product_id "wrong_id_product"
      expect(result["reviews"]).to be_nil
    end
  end

  context "#match_reviews_by_keyword" do
    it "returns reviews by keyword" do
      reviews = [{"name" => "name with"}, {"name" => "olllo", "reviewText" => ""},
                 {"name" => "", "reviewText" => "name a"}]
      result = described_class.match_reviews_by_keyword(reviews, "name")
      expect(result.size).to eq 2
    end
  end
end
