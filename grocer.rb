require 'pry'

def consolidate_cart(cart)
  final_hash = {}
  cart.each do |ele|
    ele_name = ele.keys[0]
    # p ele_name
    if final_hash.has_key?(ele_name)
      final_hash[ele_name][:count] += 1 
    else
      final_hash[ele_name] = { # add to hash and consolidate
        count: 1, # create count
        price: ele[ele_name][:price], 
        clearance: ele[ele_name][:clearance]
      }
    end
  end
  final_hash
end


def apply_coupons(cart, coupons)

  coupons.each do |coupon|
    item = coupon[:item]
    if cart[item] 
      if cart[item][:count] >= coupon[:num] && !cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance], count: 1}
        
      elsif cart[:item][:count] >= coupon[:num] && cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"][:count] += coupon[:num]
      end
        
    end
    cart[item][:count] -= coupon[:num]
  end
  cart 
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
