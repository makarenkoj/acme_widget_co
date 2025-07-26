require 'terminal-table'

# this class uses only for demonstrate how to work basket calculation and print result in terminal
class Printer
  def self.call(basket, title = 'Basket')
    rows = basket.products.map do |item|
      [item[:code], item[:name], "$#{format('%.2f', item[:price])}"]
    end

    rows << :separator
    rows << ['Total', '', "$#{format('%.2f', basket.total)}"]

    table = Terminal::Table.new(
      title: title,
      headings: ['Code', 'Product', 'Price'],
      rows: rows
    )

    puts table
  end
end
