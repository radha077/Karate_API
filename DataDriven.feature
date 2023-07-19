Feature: Using data driven

  Scenario Outline: create a user from given details.
    Given url 'https://reqres.in//api/users?page=2'
    And request {id:<id>, email:<email>, firstname:<first_name>, lastname:<last_name>, image:<avatar>}
    When method GET
    Then status 200
    Then print response
    * print 'current id is ->', id
    

    Examples: 
      | id | email                      | first_name | last_name | avatar                                   |
      |  7 | michael.lawson@reqres.in   | Michael    | Lawson    | https://reqres.in/img/faces/7-image.jpg  |
      |  8 | lindsay.ferguson@reqres.in | Lindsay    | Ferguson  | https://reqres.in/img/faces/8-image.jpg  |
      |  9 | tobias.funke@reqres.in     | Tobias     | Funke     | https://reqres.in/img/faces/9-image.jpg  |
      | 10 | byron.fields@reqres.in     | Byron      | Fields    | https://reqres.in/img/faces/10-image.jpg |
      | 11 | george.edwards@reqres.in   | George     | Edwards   | https://reqres.in/img/faces/11-image.jpg |
      | 12 | rachel.howell@reqres.in    | Rachel     | Howell    | https://reqres.in/img/faces/12-image.jpg |

  Scenario Outline: Using CSV File
    Given url 'https://reqres.in//api/users?page=2'
    And request {id:<id>, email:<email>, firstname:<first_name>, lastname:<last_name>, image:<avatar>}
    When method GET
    Then status 200
    Then print response

    Examples: 
      | read("file:src/main/resources/karateTestData.csv") |
