@adminLogin
Feature: login page

  As an Admin
  I want to see the login page as expected
  So that I can login into my account

  Scenario Outline: Admin logging with blank details
    Given I am on the login page
    When I enter userName as "<userName>", password as "<passWord>"
    And I select login
    Then I should see required "<validation messages>"
    Examples:
      | userName | passWord | validation messages      |
      |          | somepwd  | Username cannot be empty |
      | someuser |          | Password cannot be empty |

  Scenario Outline: Admin logging with invalid credentials
    Given I am on the login page
    When I enter userName as "<userName>", password as "<passWord>"
    And I select login
    Then I should be redirected to the retryLogin page
    And I should see invalid "<messages>"
    Examples:
      | userName | passWord | messages            |
      | invalid  | admin    | Invalid Credentials |
      | admin    | invalid  | Invalid Credentials |

  Scenario: Admin logging with valid credentials
    Given I am on the login page
    When I login with below credentials
      | Admin | ppFEVHJP |
    And I select login
    Then I should be on the dashboard page