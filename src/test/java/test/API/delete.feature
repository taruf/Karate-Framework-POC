@api @delete
#using https://reqres.in/ for sample APIs
Feature: DELETE Call feature

  Background:
    # calling create user endpoint
    * def user = call read('classpath:common/create.user.feature') { NAME: '#(CREATE_USER_NAME)', JOB: '#(CREATE_USER_NAME)' }

    # Test URL does not add our user, unable to get the newly created user.
    # Otherwise we could extract details    like mentioned below and use them in GET call
    #    * def userId = user.response.id
    * def userId = 2


  Scenario: Validate a user is successfully deleted

    Given url URL
    And path USERS_BASE + userId
    When method delete

    Then status 204
    And match response == ''
