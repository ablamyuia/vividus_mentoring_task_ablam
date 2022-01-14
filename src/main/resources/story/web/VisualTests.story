Description: Sign in tests;

Meta:
@proxy

Scenario:  Open sign in page
Given I am on a page with the URL 'https://www.imdb.com/registration/signin'
When I click on element located `By.xpath(//*[text()='Sign in with IMDb'])`
And I enter `${userEmail}` in field located `By.xpath(//*[@id="ap_email"])`
And I enter `${userPassword}` in field located `By.xpath(//*[@id="ap_password"])`
When I click on element located `By.xpath(//input[@id='signInSubmit'])`
Then the text 'Yuliya' exists

Scenario: Find a movie and 
Given I am on the main application page
When I enter `Home Alone` in field located `By.xpath(//*[@id="suggestion-search"])`
And I click on element located `By.xpath(//*[@id="suggestion-search-button"])`
Then the text 'Results for "Home Alone"' exists
 
Scenario: Open movie from the search
Given I am on a page with the URL 'https://www.imdb.com/find?q=Home+Alone&ref_=nv_sr_sm'
When I click on element located `By.xpath(//a[@href="/title/tt0099785/?ref_=fn_al_tt_1" and text()='Home Alone'])`
Then the text 'Home Alone' exists

Scenario: Add movie to watchlist
Given I am on a page with the URL 'https://www.imdb.com/title/tt0099785/'
When I click on element located `By.xpath(//div[@class='ipc-btn__text'])`
Then the text 'In Watchlist' exists

Scenario: Navigate to watchlist
Given I am on a page with the URL 'https://www.imdb.com/title/tt0099785/'
When I click on element located `By.xpath(//a[@href="/list/watchlist?ref_=nv_usr_wl_all_0"])`
Then the page title contains the text 'Your Watchlist'


Scenario: Sort and export the watchlist
Given I am on a page with the URL 'https://www.imdb.com/user/ur147901101/watchlist'
When I click on element located `By.xpath(//*[@id="lister-sort-by-options"])`
And I click on element located `By.xpath(//*[@id="lister-sort-by-options"]/option[2])`
And I click on element located `By.xpath(//a[text()='Export this list'])`
And I capture HTTP GET request with URL pattern `https://www.imdb.com/list/ls\d\d\d\d\d\d\d\d\d/export` and save request data to scenario variable `data`
Then `${data.responseStatus}` is equal to `200`










 