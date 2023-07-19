Feature: GET API Feature

  #get user data
  Scenario: get user details
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #get incorrect user data
  Scenario: Incorrect status code
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 400
    And print response

  #using wildcard type and query parameter
  Scenario: Using Query paramas
    Given url 'https://reqres.in/api'
    * path '/users'
    * param page = 2
    * method GET
    * status 200

  #passing json data directly
  Scenario: Passing Json response body
    Given url 'https://reqres.in/api/users?page=2'
    And def data =
      """
      {
      "page": 2,
      "per_page": 6,
      "total": 12,
      "total_pages": 2,
      "data": [
          {
              "id": 7,
              "email": "michael.lawson@reqres.in",
              "first_name": "Michael",
              "last_name": "Lawson",
              "avatar": "https://reqres.in/img/faces/7-image.jpg"
          },
        
          {
              "id": 9,
              "email": "tobias.funke@reqres.in",
              "first_name": "Tobias",
              "last_name": "Funke",
              "avatar": "https://reqres.in/img/faces/9-image.jpg"
          },
          {
              "id": 11,
              "email": "george.edwards@reqres.in",
              "first_name": "George",
              "last_name": "Edwards",
              "avatar": "https://reqres.in/img/faces/11-image.jpg"
          },
          {
              "id": 12,
              "email": "rachel.howell@reqres.in",
              "first_name": "Rachel",
              "last_name": "Howell",
              "avatar": "https://reqres.in/img/faces/12-image.jpg"
          }
      ],
      "support": {
          "url": "https://reqres.in/#support-heading",
          "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
      }
      }

      """
    And request data
    When method GET
    Then status 200
    And print response
    

  #using json folder
  Scenario: Passing json data for specific location
    Given url 'https://reqres.in/api/users?page=2'
    And json data = read("file:src/main/resources/samplePayload.json")
    And print data
    And request data
    When method GET
    Then status 200
