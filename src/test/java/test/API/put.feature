@api @put
#using https://reqres.in/ for sample APIs
Feature: PUT Call feature

  Background:
    * call read('classpath:common/utility.feature')
    * def randomNum = call randomNumber

    # calling create user endpoint
    * def user = call read('classpath:common/create.user.feature') { NAME: '#(CREATE_USER_NAME)', JOB: '#(CREATE_USER_NAME)' }

    # Test URL does not add our user, unable to get the newly created user.
    # Otherwise we could extract details like mentioned below and use them in GET call
    #    * def userId = user.response.id
    #    * def userName = user.response.name
    #    * def userJob = user.response.job
    * def userId = 2
    * def userName = 'Janet' + randomNum

  Scenario: Verify that user is updated successfully

    * def userRequestBody =
    """
    {
      "name": "morpheus",
      "job": "zion resident"
    }
    """
    * userRequestBody.name = 'NewFirstName'
    * userRequestBody.job = 'NewJobName'

    * def userResponseBody =
    """
    {
      "name": "morpheus",
      "job": "zion resident",
      "updatedAt": #string
    }
    """
    * userResponseBody.name = userRequestBody.name
    * userResponseBody.job = userRequestBody.job

    Given url URL
    And path USERS_BASE + userId
    And request userRequestBody
    When method put

    Then status 200
    And match response contains userResponseBody
    And match response.name == "NewFirstName"
    And match response.job contains "NewJob"
    And match response.name != userName
