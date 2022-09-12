@api @post
#using https://reqres.in/ for sample APIs
Feature: POST Call feature

  Scenario: Verify that user should be created successfully

    * def userRequestBody =
    """
    {
      "name": #(CREATE_USER_NAME),
      "job": #(CREATE_USER_JOB)
    }
    """

    * def userResponseBody =
    """
    {
      "name": #(CREATE_USER_NAME),
      "job": #(CREATE_USER_JOB),
      "id": #string,
      "createdAt": #string
    }
    """

    Given url URL
    And path USERS_BASE
    And request userRequestBody
    When method post

    Then status 201
    And match response contains userResponseBody
    And match response.name == CREATE_USER_NAME
    And match response.job contains "lead"
