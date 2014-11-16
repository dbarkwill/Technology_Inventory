class WikiController < ApplicationController
  before_action :set_page, only: [:show, :edit, :destroy]

  def show
    unless @page
      @page = Wiki.find_by(:page_name => 'home')
      flash[:error] = 'Page does not exist'
    end
  end

  def index
    @page = Wiki.find_by(:page_name => 'home')
    render :show
  end

  def edit
  end

  def show_all
    @pages = Wiki.all
  end

  def update
    @page = Wiki.find_by(:page_reference => wiki_params[:page_reference])
    respond_to do |format|
      if @page.update(wiki_params)
        format.html { render :show }

      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html {
        flash[:notice] =  'Page was successfully destroyed.'
        index
        }
      format.json { head :no_content }
    end
  end

  private
    def set_page
      @page = Wiki.find_by(:page_reference => params[:page_reference])
    end

    def wiki_params
      params.require(:wiki).permit(:page_reference, :id, :page_name, :contents)
    end

end
