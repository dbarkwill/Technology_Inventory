class SearchesController < ApplicationController
	layout false
	def new
	end

	def search
		@device_results = Device.search(params[:query])

		@device_property_results = DeviceProperty.search(params[:query])

		@article_results = Article.search(params[:query])

		@address_results = Address.search(params[:query])

		@inventory_results = InventoryItem.search(params[:query])

		render :results
	end

end