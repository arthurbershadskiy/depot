class StoreController < ApplicationController
  def index
		@products = Product.order(:title)
  end
	def news

	end
	def faq

	end
	def contact

	end
end
