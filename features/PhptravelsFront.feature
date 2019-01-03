@PhptravelsFront
Feature: Phptravels Front

  @SignIn
  Scenario: Signin
    Given open the website
    When user click on Log in
    Then user should on login page
    Then user fill the login form
    Then user click on login button
    Then user should logged in

  @SignUp
  Scenario: Signup
    Given open the website
    When user click on Sign up
    Then user should on signup page
    Then user fill the sign up form
    Then user click on sign up button
    Then user should automatically logged in to the website

  @BookHotelFromFeatured
  Scenario: BookHotelFromFeatured
    Given open the website
    Then user choose on hotel from feature hotel list
    Then user should on hotel detail page
    Then user choose date
    Then user choose room
    When user click book button
    Then user fills out the hotel registration form
    Then user click on confirm button
    Then user should on invoice page
    Then user choose pay on arrival