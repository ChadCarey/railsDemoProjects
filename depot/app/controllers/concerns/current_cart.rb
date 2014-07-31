module CurrentCart
  extend ActiveSupport::Concern

  private

    # This function will handle carts
    def set_cart
      # check the session for the cart id
      @cart = Cart.find(session[:cart_id])
      # rescue (catch exception) will take over if the cart_id is not found
      # it will vreate a new cart and save the new cart's id
      rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        session[:cart_id] = @cart.id
    end
end