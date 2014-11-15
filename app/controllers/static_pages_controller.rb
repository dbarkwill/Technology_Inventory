class StaticPagesController < ApplicationController
	def home
		@articles = Article.where(:front_page => true)
	end
end