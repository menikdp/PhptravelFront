Given("open the website {string}") do |string|
  @driver.navigate.to string
end

When("user click on Log in") do
  @driver.find_element(:link, 'MY ACCOUNT').click #hover
  sleep(@time)
  @driver.find_element(:link, 'Login').click
end

Then("user should on login page") do
  # Check that the form exists
  form = @wait.until {
    element = @driver.find_element(:id, "loginfrm")
    element if element.displayed?
  }
  puts "Test Passed: Form login found" if form.displayed?
end

Then("user fill the login form") do
  @driver.find_element(:name, 'username').send_keys('user@phptravels.com')
  @driver.find_element(:name, 'password').send_keys('demouser')
  @driver.find_element(:id, 'remember-me').click
  # Verify the state of checkbox
  puts "Test Passed: The check box is selected now" if @driver.find_element(:id, 'remember-me').selected? == true
end

Then("user click on login button") do
  @driver.find_element(:xpath, '//*[@id="loginfrm"]/button').click
  sleep(@time)
end

Then("user should logged in") do
  puts "Test Passed: Log in Validated" if @wait.until { /Johny Smith/.match(@driver.page_source)}
end
