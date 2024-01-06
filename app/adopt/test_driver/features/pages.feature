Feature: Can Navigate Through the Application

    Scenario: Can Navigate to the Shelter Page
        When I tap the "shelter-0" widget
        Then I expect the widget with key 'shelterpage' to be present

    Scenario: Can Navigate to the Pet Profile Page
        When I tap the "shelter-0" widget
        And I tap the "animal-0" widget
        Then I expect the widget with key 'pet-profile' to be present

    Scenario: Can Navigate to the Login Page
        When I tap the "login-button" widget
        Then I expect the widget with key 'login-page' to be present
    