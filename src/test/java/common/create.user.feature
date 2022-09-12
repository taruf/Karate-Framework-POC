Feature: Common create user feature

  Scenario: Create a user

    * def userRequestBody =
    """
    {
      "name": #(CREATE_USER_NAME),
      "job": #(CREATE_USER_JOB)
    }
    """
    * userRequestBody.name = NAME
    * userRequestBody.job = JOB

    Given url URL
    And path USERS_BASE
    And request userRequestBody
    When method post

    Then status 201
