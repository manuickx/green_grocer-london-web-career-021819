def consolidate_cart(cart)
organized_cart = {}
  cart.each do |element|
    element.each do |item, hash|
      organized_cart[item] ||= hash
      organized_cart[item][:count] ||= 0
      organized_cart[item][:count] += 1
    end
  end
organized_cart
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  cart.each do |item, value|
    if value[:clearance] == true
      value[:price] = ("%.1f" % value[:price]*0.8).to_f
        
    end
  end
end


def checkout(cart, coupons)
  # code here
end
