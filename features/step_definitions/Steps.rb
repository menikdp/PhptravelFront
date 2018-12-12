Given("open the website") do
  @driver.navigate.to "https://phptravels.net"
end

#------------ begin of SignIn scenario -------------------
When("user click on Log in") do
  @driver.find_element(:link, 'MY ACCOUNT').click
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
# ----------- end of SignIn scenario -----------------------

#------------ begin of SignUp scenario ---------------------
When("user click on Sign up") do
  @driver.find_element(:link, 'MY ACCOUNT').click
  sleep(@time)
  @driver.find_element(:link, 'Sign Up').click
end

Then("user should on signup page") do
  # Check that the form exists
  form_signup = @wait.until {
    signup_form = @driver.find_element(:id, "headersignupform")
    signup_form if signup_form.displayed?
  }
  puts "Test Passed: Form Signup found" if form_signup.displayed?
end

Then("user fill the sign up form") do
  #create fake data
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  mobile_number = Faker::PhoneNumber.cell_phone
  email = Faker::Internet.safe_email
  password = Faker::Internet.password(10)
  #fill the form
  @driver.find_element(:name, 'firstname').send_keys(first_name)
  @driver.find_element(:name, 'lastname').send_keys(last_name)
  @driver.find_element(:name, 'phone').send_keys(mobile_number)
  @driver.find_element(:name, 'email').send_keys(email)
  @driver.find_element(:name, 'password').send_keys(password)
  @driver.find_element(:name, 'confirmpassword').send_keys(password)
end

Then("user click on sign up button") do
  @driver.find_element(:xpath, '//*[@id="headersignupform"]/div[9]/button').click
  sleep(@time)
end

Then("user should automatically logged in to the website") do
  puts "Test Passed: Log in Validated" if @wait.until { /Hi,/.match(@driver.page_source)}
end
#------------ end of SignUp scenario ---------------------