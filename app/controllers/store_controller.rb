class StoreController < ApplicationController
  def counter
		if session[:counter].nil?
			session[:counter] = 0
		end
		session[:counter] += 1
  end
	def index
		@products = Product.order(:title)
		@visits = counter
		@cart = current_cart
  end
	def news

	end
	def faq

	end
	def contact

	end
end
