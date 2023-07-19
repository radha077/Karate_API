Feature: Put API Feature

  Scenario: using put method and then delete the data
    Given url 'https://reqres.in//api/users/2'
    * def data =
      """
      {
      "name": "morpheus",
      "job": "zion resident"
      }
      """
    * method PUT
    * status 200
    * print response
    * def newURL = 'https://reqres.in//api/users/2'
    Given url newURL
    And method delete
    Then status 204
    * print response

  Scenario: Read Static XML File
    * def doWork =
      """
      <?xml version="1.0"?>
        <catalog>
            <book id="bk101">
                <author>Gambardella, Matthew</author>
                <title>XML Developer's Guide</title>
                <genre>Computer</genre>
                <price>44.95</price>
                <publish_date>2000-10-01</publish_date>
                <description>An in-depth look at creating applications
                    with XML.</description>
            </book>
        </catalog>

      """
    Given print  doWork

  Scenario: Read classpath XML File
    Given print karate.readAsString("file:src/main/resources/sample.xml")

  Scenario: Read classpath XML File as Request Body
    * def requestXMLBody = karate.readAsString("file:src/main/resources/sample.xml")
    Given url 'http://dummy.restapiexample.com/api/v1/create'
    When request requestXMLBody
    And method post
    Then status 404
    * print requestXMLBody
