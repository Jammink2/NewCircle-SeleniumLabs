require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

session = Capybara::Session.new(:poltergeist)
session.visit('http://awesome-boutique-9152.spree.mx/')
session.save_screenshot('homepage.png')
session.find(:css, "div.container > nav.columns.seven > #main-nav-bar > #shop-link > a > span.translation_missing").click
session.find(:css, "img[alt=\"Ruby on Rails Tote\"]").click

session.click_button('add-to-cart-button')

session.find(:css, ".continue.button.gray").click
session.find(:xpath, "//aside[@id='sidebar']//a[.='Spree']").click
session.find(:css, "img[alt=\"Spree Ringer T-Shirt\"]").click
session.click_button('add-to-cart-button')

# Reference http://www.rubydoc.info/github/jnicklas/capybara/Capybara/Node/Matchers#has_text%3F-instance_method
session.find(:xpath, ".//*[@class='cart-total']/td[2]/h5").has_text? ('$35.98')

session.find(:css, ".continue.button.gray").click
session.find(:css, "img[alt=\"Ruby on Rails Tote\"]").click
session.click_link('Featured')
session.check('$15.00 - $18.00')
session.click_button('Search')

session.find(:css, "a.cart-info.full").click
session.find(:xpath, ".//*[@class='cart-total']/td[2]/h5").has_text? ('$35.98')
session.fill_in('order_coupon_code', :with => 'NewCircle')
session.click_button('Update')
session.find(:xpath, ".//*[@id='cart_adjustments']/tr/td[2]").has_text? ('$7.20')

element = session.find(:id, "order_line_items_attributes_0_quantity")
#  http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Element

element.set('2')

# Validate value set

element.value == '2'

session.save_screenshot('final.png')
