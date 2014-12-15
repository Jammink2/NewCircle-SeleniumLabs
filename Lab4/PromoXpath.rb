require 'selenium-webdriver'
browser = Selenium::WebDriver.for :firefox

browser.get "https://awesome-boutique-9152.spree.mx/"
browser.find_element(:css, "div.container > nav.columns.seven > #main-nav-bar > #shop-link > a > span.translation_missing").click
browser.find_element(:css, "img[alt=\"Ruby on Rails Tote\"]").click
browser.find_element(:id, "add-to-cart-button").click

# link_text updated to css

browser.find_element(:css, ".continue.button.gray").click

# Even though a css could be found, selenium thinks the element in question is invisible.
#  css = #taxonomies>.taxons-list>li>a[href='/t/brand/spree']
browser.find_element(:xpath, "//aside[@id='sidebar']//a[.='Spree']").click


browser.find_element(:css, "img[alt=\"Spree Ringer T-Shirt\"]").click
browser.find_element(:id, "add-to-cart-button").click
if not browser.find_element(:tag_name, "html").text.include? "$35.98"
    print "verifyTextPresent failed"
end
browser.find_element(:css, ".continue.button.gray").click
browser.find_element(:css, "img[alt=\"Ruby on Rails Tote\"]").click
browser.find_element(:link_text, "Featured").click
if not browser.find_element(:id, "Price_Range_$15.00_-_$18.00").selected?
    browser.find_element(:id, "Price_Range_$15.00_-_$18.00").click
end
browser.find_element(:name, "button").click

# Updated with same css as before
browser.find_element(:css, "a.cart-info.full").click

# css .cart-subtotal>td>h5 could not be found by selenium, switched to xpath
#  Reason is that the original code will return the html element because the site contains $35.98
if not browser.find_element(:xpath, ".//*[@class='cart-total']/td[2]/h5").text.include? "$35.98"
    print "verifyTextPresent failed"
end

# Apply Discount by entering text into field

browser.find_element(:id, "order_coupon_code").send_keys "NewCircle"
browser.find_element(:id, "update-button").click

# Validating discount

if not browser.find_element(:xpath, ".//*[@id='cart_adjustments']/tr/td[2]").text.include? "$7.20"
    print "verifyTextPresent failed"
end

# Adding additional item using javascript
element = browser.find_element(:id, "order_line_items_attributes_0_quantity")
puts element.attribute("value")

script = "return arguments[0].value = '2'"
browser.execute_script(script, element)
puts element.attribute("value") 

# Validating Update

if element.attribute("value").to_i != 2
  print "Value did not update to 2"
end

browser.quit
