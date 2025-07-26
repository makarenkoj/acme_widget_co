class Basket
  def initialize(products:, delivery_rules:, offer_rules:)
    @products_catalog = products
    @delivery_rules = delivery_rules
    @offer_rules = offer_rules
    @items = []
  end

  def add_item(product_code)
    product = @products_catalog[product_code.to_sym]
    raise 'Product not found' unless product

    @items << {
                code: product_code,
                name: product[:name],
                price: product[:price].to_f
              }
  end

  def products
    @items
  end

  def total
    (total_price + delivery_cost - calculate_discount).round(2)
  end

  private

  def total_price
    @items.sum { |item| item[:price] }
  end

  def delivery_cost
    total = total_price
    return 0.0 if total.zero?
    @delivery_rules.each do |threshold, cost|
      return cost.to_f if total < threshold.to_s.to_f
    end

    0.0
  end

  def calculate_discount
    total_discount = 0.0

    @offer_rules.each do |code, rule|
      code_str = code.to_s
      count = @items.count { |item| item[:code] == code_str }

      if count >= rule[:min_quantity]
        price = @products_catalog[code.to_sym][:price].to_f
        discount_rate = rule[:discount].to_f / 100
        number_of_pairs = count / 2
        discount_for_offer = number_of_pairs * price * discount_rate
        total_discount += discount_for_offer
      end
    end

    total_discount
  end
end
