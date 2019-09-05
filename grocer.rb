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
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
