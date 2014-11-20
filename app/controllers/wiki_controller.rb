class WikiController < ApplicationController
  before_action :set_page, only: [:show, :edit, :destroy]
  before_action :find_tags, only: [:show, :index, :edit, :update]


  # GET /wiki/new
  def new
    @page = Wiki.new
  end

  # POST /wiki
  def create
    @page = Wiki.new(wiki_params)
    respond_to do |format|
      if @page.save
        format.html { redirect_to wiki_show_path(@page.page_reference), notice: 'Page was successfully created.'}
      else
        format.html { redirect_to action: index, notice: 'There was an error creating the page.'}
      end
    end
  end


  # GET /wiki/:page_reference
  def show
    unless @page
      flash[:error] = 'Page does not exist'
      redirect_to action: 'show_all'
    end
  end

  # GET /wiki
  def index
    @pages = Wiki.is_root
    @recentally_updated = Wiki.order(:updated_at).reverse_order.limit(5)
    @recentally_created = Wiki.order(:created_at).reverse_order.limit(5)
  end

  def edit
    @recentally_updated = Wiki.order(:updated_at).reverse_order.limit(5)
    @recentally_created = Wiki.order(:created_at).reverse_order.limit(5)
  end

  # GET /wiki/show_all
  def show_all
    @pages = Wiki.all
  end

  # PATCH /wiki
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

  # DELETE /wiki/:page_reference
  def destroy
    @page.destroy
    respond_to do |format|
      format.html {
        flash[:notice] =  'Page was successfully destroyed.'
        redirect_to action: 'show_all'
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
      params.require(:wiki).permit(:page_reference, :id, :page_name, :contents, :tag_list, :root)
    end

end
