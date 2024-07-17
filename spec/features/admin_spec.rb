require 'rails_helper'

RSpec.feature "Admin", type: :feature do
  let(:admin_user) { create(:admin_user) }
  
  before do
    login_as(admin_user, scope: :admin_user)
  end
  
  scenario "Admin adds a product" do
    visit admin_products_new_path
    
    fill_in "product[name]", with: "New Product"
    fill_in "product[description]", with: "Product Description"
    fill_in "product[base_price]", with: 150.0
    click_button "Create Product"
    expect(Product.last.name).to eq("New Product")
  end

  scenario "Admin adds a part" do
    visit admin_parts_new_path
    
    fill_in "part[name]", with: "New Part"
    find("option[value='frame_type']").click
    fill_in "part[price]", with: 20.0
    fill_in "part[stock]", with: 5
    click_button "Create Part"
    expect(Part.last.name).to eq("New Part")
  end

  scenario "Admin adds a combination" do
    part1 = create(:part, category: "frame_type")
    part2 = create(:part, category: "wheels")

    visit admin_combinations_new_path
    find("#combination_condition_part_id option[value=#{part1.id}]").select_option
    find("#combination_affected_part_id option[value='#{part2.id}']", match: :first).select_option
    check "Allowed"
    fill_in "combination[additional_price]", with: 5.0
    click_button "Create Combination"
    expect(Combination.last.additional_price).to eq(5.0)
  end
end
