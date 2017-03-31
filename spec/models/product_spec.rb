require 'rails_helper'

describe Product do

	context "when the product has coments" do
		before do
			@product = Product.create!(name: "race bike")
			@user = User.create!(email:"justin@gmail.com", password:"123456")
			@product.comments.create!(rating: 1, user: @user, body: "Aweful bike!")	
			@product.comments.create!(rating:3, user: @user, body: "Decent bike!")
			@product.comments.create!(rating:5, user: @user, body: "Pretty nice Bike!")	
		end
		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end
	end

	context "product not valid" do
		it "description only returns not valid" do
			expect(Product.new(description: "Nice!")).not_to be_valid
		end
	end	
end