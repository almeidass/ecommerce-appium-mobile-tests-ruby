When('the user opens the {string} category') do |category|
  HomeScreen.open_category(category)
end

Then('the product list should be displayed') do
  ProductListScreen.wait_until_loaded
  expect(ProductListScreen.has_products?).to eq(true)
end
