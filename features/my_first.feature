Feature: Login feature

  Scenario: Navigate to webpage and print broswer name
    And I click on element having xpath "//ul[@id='main-nav']/li[1]"
    And I wait for 5 sec
    And I navigate back to previous webpage
    And I wait for 5 sec
    And I navigate forward on webpage
    And I wait for 5 sec
    And I navigate back to previous webpage
    And I wait for 5 sec
    And I refresh page
    And I wait for 5 sec
    And I wait for 4 sec
    And I print yaml file path and variable
    Then element having xpath "$yaml_hash['link_text']" should have text as "This is a link"
    And I wait for 4 sec
    And I get text of element having xpath "//div[@class='textwidget']//p[1]"
    And I enter "text" into input field having xpath "//div[@class='textwidget']//p[2]//input"
    And I wait for 2 sec
    And I click on element having xpath "//button[@id='button1']"
    And I use new window
    And I wait for 5 sec
    Then I maximize browser window
    And element having xpath "//ul[@id='main-nav']" should be present
    And I close current window and switch back to previous window
    And I wait for 4 sec
    And I click on element having xpath "//input[@value='Subscribe']"
    
  Scenario: Switch to alert and its working
      And I click on element having xpath "//button[@id='alert']"
      And I check alert is present
      And I wait for 5 sec
