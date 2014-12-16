Feature:  As a shopper, when I need to get a gift, then I can purchase

Scenario:  I'm in trouble with my wife, I need to buy an expensive

Given I visit the website
And I click on "shop" 
And I click on "rails"
And I check on "$20.00 or over"
When I click on "tote bag"
And I add it to the cart
Then it is in my shopping cart
