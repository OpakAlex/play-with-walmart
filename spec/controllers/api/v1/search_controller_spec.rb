require "rails_helper"

describe Api::V1::SearchController do
  context "#search" do
    it "returns views by product id and keyword" do
      get :index, product_id: 40712755, keyword: "Apple iPad"
      expect(response.status).to eq 200
      expect(JSON.parse(response.body).size).to eq 5
    end

    it "returns 422 if product id is wrong" do
      get :index, product_id: "missing_pr", keyword: "Apple iPad"
      expect(response.status).to eq 422
    end

    it "returns 422 if params not exist product_id" do
      get :index, keyword: "Apple iPad"
      expect(response.status).to eq 422
    end

    it "returns all reviews if not pass kwyword" do
      get :index, product_id: 40712755
      expect(response.status).to eq 200
      expect(JSON.parse(response.body).size).to eq 5
    end
  end
end
