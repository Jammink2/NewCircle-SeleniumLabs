require 'rubygems'
require 'selenium-webdriver'
wd = Selenium::WebDriver.for :firefox

wd.get "http://awesome-boutique-9152.spree.mx/"
wd.find_element(:css, "div.container > nav.columns.seven > #main-nav-bar > #shop-link > a > span.translation_missing").click
wd.find_element(:css, "img[alt=\"Ruby on Rails Tote\"]").click
if not wd.find_element(:tag_name, "html").text.include? "$15.99"
    print "verifyTextPresent failed"
end
wd.find_element(:id, "taxon-crumbs").click
wd.find_element(:id, "quantity").click
wd.find_element(:id, "quantity").send_keys "\\undefined"
wd.find_element(:id, "quantity").click
wd.find_element(:id, "add-to-cart-button").click
if not wd.find_element(:tag_name, "html").text.include? "$31.98"
    print "verifyTextPresent failed"
end
wd.find_element(:css, "td.cart-item-description").click
wd.find_element(:link_text, "CONTINUE SHOPPING").click
wd.find_element(:xpath, "//aside[@id='sidebar']//a[.='Apache']").click
if not wd.find_element(:id, "Price_Range_$15.00_-_$18.00").selected?
    wd.find_element(:id, "Price_Range_$15.00_-_$18.00").click
end
wd.find_element(:name, "button").click
if not wd.find_element(:tag_name, "html").text.include? "No products found"
    print "verifyTextPresent failed"
end
wd.find_element(:css, "a.cart-info.full").click
if not wd.find_element(:tag_name, "html").text.include? "Shopping Cart"
    print "verifyTextPresent failed"
end
wd.quit
