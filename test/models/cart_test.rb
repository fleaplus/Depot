require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products
  fixtures :line_items
  
  test "cart line item should have quantity of one" do
    cart = Cart.new
    product = products(:ruby);
    cart.add_product(product.id,product.price)
    cart.add_product(product.id,product.price)
    cart.save
    
    assert cart.line_items.size != 2, "number of line_items should NOT be 2"
    assert cart.line_items.size == 1, "number of line_items should be 1"
  end
  
  test "cart line item should have quantity of two" do
    cart = Cart.new
    cart.add_product(products(:one).id,products(:one).price)
    cart.add_product(products(:two).id,products(:two).price)
    cart.save
    
    assert cart.line_items.size == 2, "number of line_items should be 2"
  end
  
end
