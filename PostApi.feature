Feature: Post API Feature

  Scenario: Using Assertions
    Given url 'https://reqres.in/api/users'
    * request {"name": "radha","job": "software"}
    * method POST
    * status 201
    * match response == {"name": "radha","job": "software","id": "#string","createdAt": "#ignore"}
    * print response

  Scenario: using json and replace the data
    Given url 'https://reqres.in/api/login'
    And header Content-Type = 'application/json'
    And json data = read("file:src/main/resources/samplePayload.json")
    * print data
    * set data.firstName = 'Saranya'
    When method post
    Then status 400
    * print data

  