Description: Sign in tests;


Scenario:  Open sign in page
Given I am on a page with the URL 'https://www.imdb.com/registration/signin'
When I click on element located `By.xpath(//*[text()='Sign in with IMDb'])`
And I enter `${userEmail}` in field located `By.xpath(//*[@id="ap_email"])`
And I enter `${userPassword}` in field located `By.xpath(//*[@id="ap_password"])`
When I click on element located `By.xpath(//input[@id='signInSubmit'])`
Then element located `By.xpath(//*[text()='Yuliya'])` exists

Scenario: Find a movie and 
Given I am on the main application page
When I enter `Home Alone` in field located `By.xpath(//*[@id="suggestion-search"])`
And I click on element located `By.xpath(//*[@id="suggestion-search-button"])`
Then the text 'Results for "Home Alone"' exists
 
Scenario: Open movie from the search
Given I am on a page with the URL 'https://www.imdb.com/find?q=Home+Alone&ref_=nv_sr_sm'
When I click on element located `By.xpath(//a[@href="/title/tt0099785/?ref_=fn_al_tt_1" and text()='Home Alone'])`
Then element located `By.xpath(//h1[text()='Home Alone'])` exists

Scenario: Add movie to watchlist
Given I am on a page with the URL 'https://www.imdb.com/title/tt0099785/'
When I click on element located `By.xpath(//div[@class='ipc-btn__text'])`
Then the text 'In Watchlist' exists

Scenario: Navigate to watchlist
Given I am on a page with the URL 'https://www.imdb.com/title/tt0099785/'
When I click on element located `By.xpath(//a[@href="/list/watchlist?ref_=nv_usr_wl_all_0"])`
Then element located `By.xpath(//a[text()='Home Alone'])` exists

Scenario: Sort the watchlist
Given I am on a page with the URL 'https://www.imdb.com/user/ur147901101/watchlist'
When I click on element located `By.xpath(//*[@id="lister-sort-by-options"])`
And I click on element located `By.xpath(//*[@id="lister-sort-by-options"]/option[2])`
And I click on all elements located `By.xpath(//a[text()='Export this list'])`
Then response header 'content-disposition' contains attribute: attachment













 