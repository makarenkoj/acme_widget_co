require 'json'
require_relative 'basket'
require_relative 'printer'

products = JSON.parse(File.read('products.json'), symbolize_names: true)
delivery_rules = JSON.parse(File.read('delivery_rules.json'), symbolize_names: true)
offer_rules = JSON.parse(File.read('offer_rules.json'), symbolize_names: true)

basket = Basket.new(products: products, delivery_rules: delivery_rules, offer_rules: offer_rules)
basket.add_item('G01')
basket.add_item('B01')

basket2 = Basket.new(products: products, delivery_rules: delivery_rules, offer_rules: offer_rules)
basket2.add_item('R01')
basket2.add_item('R01')

basket3 = Basket.new(products: products, delivery_rules: delivery_rules, offer_rules: offer_rules)
basket3.add_item('R01')
basket3.add_item('G01')

basket4 = Basket.new(products: products, delivery_rules: delivery_rules, offer_rules: offer_rules)
basket4.add_item('B01')
basket4.add_item('B01')
basket4.add_item('R01')
basket4.add_item('R01')
basket4.add_item('R01')

Printer.call(basket, 'Basket 1')
Printer.call(basket2, 'Basket 2')
Printer.call(basket3, 'Basket 3')
Printer.call(basket4, 'Basket 4')
