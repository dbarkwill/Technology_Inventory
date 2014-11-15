class WikiController < ApplicationController
  def show
    @page = Wiki.find_or_create_by(:page_name => params[:page_name])
  end
end
