Given('the application is launched') do
  expect(@driver.session_id).not_to be_nil
end

Given('the user is on the home screen') do
  HomeScreen.ensure_ready
  expect(HomeScreen.loaded?).to eq(true)
end

When('the user dismisses the welcome modal if it is displayed') do
  WelcomeScreen.dismiss if WelcomeScreen.visible?
end

Then('the user should see the home screen') do
  elements = find_elements(:class, 'android.widget.ImageView')
  expect(elements.any?).to eq(true)
end
