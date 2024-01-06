Feature: Login System Works
    Scenario: Login with email and password are correct
        When I tap the "login-button" widget
        And I fill the "email-field" text widget with "associacaozooloficadeevora@email.com"
        And I fill the "password-field" text widget with "admin"
        And I tap the "submit-button" widget
        Then I expect the widget with key 'create-animal-screen' to be present

    Scenario: Login with email and password are incorrect
        When I tap the "login-button" widget
        And I fill the "email-field" text widget with "associacaozooloficadeevora@email.com"
        And I fill the "password-field" text widget with "WrongPassword"
        And I tap the "submit-button" widget
        Then I expect the widget with key 'error-message' to be present