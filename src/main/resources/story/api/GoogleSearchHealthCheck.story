Description: Google search health check

Scenario: Verify google search is available
When I issue a HTTP HEAD request for a resource with the URL 'https://google.com/'
Then `${responseCode}` is equal to `200`

Scenario:  Open sign in page
Given I am on the main application page
When I click on element located `By.xpath(//*[text()='Sign In'])`
And I click on element located `By.xpath(//*[text()='Sign In with IMDb'])`
Then element located `By.xpath(//form[@name='signIn'])` exists