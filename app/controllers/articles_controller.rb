class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, only: [:show, :edit, :new, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).where(:published => true)
    elsif params[:search]
      @articles = Article.search(params[:search]).where(:published => true)
    else
      @articles = Article.all.where(:published => true)
    end

    @tags = Array.new
    Tag.all.each do |tag|
      @tags << tag if tag.articles.count > 0
    end

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    @article.user = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def linkable_type_select
    @linkable = params[:linkable_type].classify.constantize

    @linkable_ids = @linkable.all.map { |linkable| [linkable.name, linkable.id] }

    respond_to do |format|
      format.js
    end
  end

  def link
    @article = Article.find_by_id(params[:article])
    @link = @article.links.create(:linkable_id => params[:linkable_id], :linkable_type => params[:linkable_type])

    respond_to do |format|
      if @link.save
        format.html { redirect_to @article, notice: 'Article linked.'}
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    params[:article][:front_page] ||= []
    params[:article][:published] ||= []

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
        format.js { render :update }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
        format.js { render :update }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :tag_list, :summary, :published, :front_page)
    end
end
