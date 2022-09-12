@api @get
#using https://reqres.in/ for sample APIs
Feature: GET Call feature

  Background:
    # calling create user endpoint
    * def user = call read('classpath:common/create.user.feature') { NAME: '#(CREATE_USER_NAME)', JOB: '#(CREATE_USER_NAME)' }

    # Test URL does not add our user, unable to get the newly created user.
    # Otherwise we could extract details like mentioned below and use them in GET call
    #    * def userId = user.response.id
    #    * def userName = user.response.name
    #    * def userJob = user.response.job
    * def userId = 2
    * def userName = 'Janet'


  Scenario: Verify that get user call is successful

    * def userResponseBody =
    """
    {
      "data":{
        "id": #(userId),
        "email": "janet.weaver@reqres.in",
        "first_name": #(userName),
        "last_name": "Weaver",
        "avatar": "https://reqres.in/img/faces/2-image.jpg"
      },
      "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
      }
    }
    """

    Given url URL
    And path USERS_BASE + userId
    When method get

    Then status 200
    And match response contains userResponseBody
