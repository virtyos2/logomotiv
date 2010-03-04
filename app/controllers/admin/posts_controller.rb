class Admin::PostsController < ApplicationController
  layout "admin"
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |wants|
      if @post.save
        flash[:notice] = 'Страница успешно создана.'
        wants.html { redirect_to(admin_posts_url) }
        wants.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    respond_to do |wants|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Страница сохранена.'
        wants.html { redirect_to(admin_posts_url) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post.destroy

    respond_to do |wants|
      wants.html { redirect_to(admin_posts_url) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

end
