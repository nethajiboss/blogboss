class ArticlesController < ApplicationController
  Mime::Type.register "application/pdf", :pdf 
  before_filter :authenticate, :except => [:index, :show, :notify_friend]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.search(params[:search]).paginate :page=>params[:page], :order=>'created_at desc' ,:per_page => 2
        respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => articles_path }
      format.js
    end

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = current_user.articles.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, :notice => 'Article was successfully created.' }
        format.json { render :json => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = current_user.articles.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to articles_path, :notice => 'Article was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :ok }
    end 
  end
  
  def notify_friend
    @article = Article.find(params[:id])
      Notifier.email_friend(@article, params[:name], params[:email]).deliver
      redirect_to @article, :notice => "Successfully sent a message to your friend"
  end

end
