Feature: Profile
    Scenario: User can view animal name
        When I tap the "shelter-0" widget
        And I tap the "animal-0" widget
        Then I expect the widget with key 'name' to be present

    Scenario: User can view animal description
        When I tap the "shelter-0" widget
        And I tap the "animal-0" widget
        Then I expect the widget with key 'description' to be present

    Scenario: User can view favourite button    
        When I tap the "shelter-0" widget
        And I tap the "animal-0" widget
        Then I expect the widget with key 'favourite' to be present

    Scenario: User can view animal info
        When I tap the "shelter-0" widget
        And I tap the "animal-0" widget
        Then I expect the widget with key 'shelter-name' to be present
        Then I expect the widget with key 'shelter-address' to be present
        Then I expect the widget with key 'shelter-phone' to be present
        Then I expect the widget with key 'shelter-time' to be present
        