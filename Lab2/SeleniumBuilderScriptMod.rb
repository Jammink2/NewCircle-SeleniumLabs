require 'selenium-webdriver'
wd = Selenium::WebDriver.for :firefox

wd.get "https://awesome-boutique-9152.spree.mx/"
wd.find_element(:css, "div.container > nav.columns.seven > #main-nav-bar > #shop-link > a > span.translation_missing").click
wd.find_element(:css, "img[alt=\"Ruby on Rails Tote\"]").click
wd.find_element(:id, "add-to-cart-button").click
wd.find_element(:link_text, "CONTINUE SHOPPING").click
wd.find_element(:xpath, "//aside[@id='sidebar']//a[.='Spree']").click
wd.find_element(:css, "img[alt=\"Spree Ringer T-Shirt\"]").click
wd.find_element(:id, "add-to-cart-button").click
if not wd.find_element(:tag_name, "html").text.include? "$35.98"
    print "verifyTextPresent failed"
end
#wd.find_element(:css, "span.amount").click
wd.find_element(:link_text, "CONTINUE SHOPPING").click
wd.find_element(:css, "img[alt=\"Ruby on Rails Tote\"]").click
wd.find_element(:link_text, "Featured").click
if not wd.find_element(:id, "Price_Range_$15.00_-_$18.00").selected?
    wd.find_element(:id, "Price_Range_$15.00_-_$18.00").click
end
wd.find_element(:name, "button").click
wd.find_element(:css, "a.cart-info.full").click
if not wd.find_element(:tag_name, "html").text.include? "$35.98"
    print "verifyTextPresent failed"
end
wd.quit
