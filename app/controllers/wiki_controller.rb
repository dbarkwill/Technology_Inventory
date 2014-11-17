class WikiController < ApplicationController
  before_action :set_page, only: [:show, :edit, :destroy]
  before_action :find_tags, only: [:show, :index, :edit, :update]

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
    @recentally_updated = Wiki.order(:updated_at).reverse_order.limit(5)
    @recentally_created = Wiki.order(:created_at).reverse_order.limit(5)
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

    def find_tags
      @tags = Array.new
      Tag.all.each do |tag|
        @tags << tag if tag.wikis.count > 0
      end
    end

    def wiki_params
      params.require(:wiki).permit(:page_reference, :id, :page_name, :contents, :tag_list)
    end

end
