class StoreController < ApplicationController
  def index
  	@products = Product.order(:title) # .order(:title) puts them in alphabetical order by title
  end
end
