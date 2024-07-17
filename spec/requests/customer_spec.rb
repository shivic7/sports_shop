# spec/requests/customer_spec.rb
require 'rails_helper'

RSpec.describe "Customer", type: :request do
  let(:customer) { create(:customer) }
  let!(:product) { create(:product) }
  let!(:frame) { create(:part, category: 'frame_type', name: 'Full Suspension') }
  let!(:wheels) { create(:part, category: 'wheels', name: 'Mountain Wheels') }
  let!(:combination) { create(:combination, condition_part: wheels, affected_part: frame, allowed: true) }
  let!(:forbidden_combination) { create(:combination, condition_part: wheels, affected_part: create(:part, category: 'frame_type', name: 'Diamond'), allowed: false) }

  before do
    login_as(customer, scope: :customer)
  end

  describe "adding a product with allowed combination" do
    it "adds the product to the cart" do
      expect {
        post cart_items_create_path, params: { product_id: product.id, quantity: 1, customization_options: { frame_type: frame.id, wheels: wheels.id } }
      }.to change(CartItem, :count).by(1)
    end
  end

  describe "adding a product with not allowed combination" do
    it "does not add the product to the cart" do
      expect {
        post cart_items_create_path, params: { product_id: product.id, quantity: 1, customization_options: { frame_type: forbidden_combination.affected_part.id, wheels: wheels.id } }
      }.not_to change(CartItem, :count)
    end
  end
end
