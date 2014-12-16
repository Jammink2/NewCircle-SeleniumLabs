Given(/^I visit the website$/) do
  visit('https://awesome-boutique-9152.spree.mx')
end

Given(/^I click on "(.*?)"$/) do |button|

  if button == "shop"
    find(:css, "div.container > nav.columns.seven > #main-nav-bar > #shop-link > a > span.translation_missing").click
  elsif button == "rails"
    find(:xpath, ".//*[@id='taxonomies']/ul[2]/li[4]/a").click
  elsif button == "tote bag"
    find(:css, "img[alt=\"Ruby on Rails Bag\"]").click
  else
    puts "Failed"
  end
  sleep 2
end


Given(/^I check on "(.*?)"$/) do |checkbox|
  check(checkbox)
  click_button('Search')
end

When(/^I add it to the cart$/) do
  click_button('add-to-cart-button')
end

Then(/^it is in my shopping cart$/) do
  element = find(:css, '.cart-info.full')
  (element.text =~ /CART: \(2\)/i).should_not == nil
  puts element.text
end
