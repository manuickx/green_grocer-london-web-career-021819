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
  coupons.each do |coup|
    item = coup[:item]
    hash_wcoupon = {
      :price => coup[:cost],
      :clearance => "",
      :count => coup[:num] 
      }
    if cart.has_key?(item) && cart[item][:count] >= hash_wcoupon[:count] 
      hash_wcoupon[:clearance] = cart[item][:clearance]
      hash_wcoupon[:count] = cart[item][:count]/hash_wcoupon[:count]
      cart[item][:count] = cart[item][:count] - coup[:num]
      cart[item + " W/COUPON"] = hash_wcoupon
    end
  end
cart.delete_if {|name, attrib| attrib[:count] == 0}
return cart
end

def apply_clearance(cart)
  cart.each do |item, value|
    if value[:clearance] == true
      disc_price = value[:price]*0.8
        value[:price] = ("%.1f" % disc_price).to_f
    end
  end
end


def checkout(cart, coupons)
  # code here
end
