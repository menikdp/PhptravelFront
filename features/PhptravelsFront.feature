@PhptravelsFront
Feature: Phptravels Front

  @SignIn
  Scenario: UserSignin
    Given open the website "https://phptravels.net"
    When user click on Log in
    Then user should on login page
    Then user fill the login form
    Then user click on login button
    Then user should logged in