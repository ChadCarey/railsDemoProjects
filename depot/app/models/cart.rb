class Cart < ActiveRecord::Base
	# "has_many :line_items" this tells the cart that it has many line _items
	# the line items each hae an id to this cart
	# ", dependent: :destroy" this tells the model that
	# the cart's line items are destroyed when the cart is destroyed
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		current_item = line_items.find_by(product_id: product_id)
		if current_item # if found in line_items
			current_item.quantity += 1 # increase quantity
		else # create new line item
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end
end
