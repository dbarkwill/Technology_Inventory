class Admin::DashboardController < ApplicationController

	before_filter :authenticate_user!

	def index
		authorize self
		@pending_published = Article.where(:published => false)
	end
end