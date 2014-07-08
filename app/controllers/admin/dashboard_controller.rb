class Admin::DashboardController < ApplicationController

	before_filter :authenticate_user!

	def index
		authorize self
	end
end