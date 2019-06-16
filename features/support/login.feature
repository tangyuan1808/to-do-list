Feature: Signup/login/logout
  As a user
  I should be able to sign up, sign in, sign out

  Scenario: User sign up failed
    Given I visit the user sign up page
    When I click submit
    Then I should see a error message
    And I should stay on signup page

  Scenario: User login failed
    Given I visit the user login page
    When I click submit
    Then I should see a error message
    And I should stay on login page

  Scenario: User sign up succeed, then can log in, log out
    Given I visit the user sign up page
    And I fill name with 'Liang'
    And I fill email with 'test@gmail.com'
    And I fill password with 'password'
    And I fill password confirmation with 'password'
    When I click submit
    Then I should see a success message
    And I should be redirected to login page
    When I fill login email with 'test@gmail.com'
    And I fill login password with 'password'
    And I click submit
    Then I should be redirected to list index page
    And I should see a success message
    When I click on logout link
    Then I should be redirected to login page
    And I should see a success message