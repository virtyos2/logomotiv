class Admin::PagesController < AdminController
  layout "admin"
  before_filter :find_page, :only => [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.find(:all, :order => "position DESC")

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @page }
    end
  end
  

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    #@parent_page = Page.find(params[:page][:parent_id])
    
    @page = Page.new(params[:page])
    #@page.move_to_child_of(@parent_page)
    
    respond_to do |wants|
      if @page.save
        flash[:notice] = 'Страница успешно создана.'
        wants.html { redirect_to(admin_pages_url) }
        wants.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    respond_to do |wants|
      if @page.update_attributes(params[:page])
        
        flash[:notice] = 'Страница сохранена.'
        wants.html { redirect_to(admin_pages_url) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page.destroy

    respond_to do |wants|
      wants.html { redirect_to(admin_pages_url) }
      wants.xml  { head :ok }
    end
  end
  
  def list_parent
    @pages = Page.find(:all, :conditions => {:parent_id => params[:id]})
    render :partial => "list_parent"
=begin
    respond_to do |wants|
      wants.xml { render @pages.to_xml }
      wants.js {
        render :update do |page|
          page.insert_html :after, '.list', :partial => "list_parent"
          
        end
      }
      wants.html {
        render :partial => "list_parent"
      }
    end
=end
  end
  
  def context_menu
    @page = Page.find(params[:id]) if params[:type] == 'page'
    @page = Item.find(params[:id]) if params[:type] == 'item'
    respond_to do |wants|
      wants.js {
        render :partial => "context_menu"
      }
      wants.html {
        render :partial => "context_menu"
      }
    end
  end
  
  def up
    @page = Page.find(params[:page_id])
    @page.move_up!
    render :action => :index
  end
  
  def down
    @page = Page.find(params[:page_id])
    @page.move_down!
    render :action => :index
  end

  def sort
#render :text => params['.pages']
    if params['.pages']
      params['.pages'].each_with_index do |id, index|
        Page.update_all(['position=?', index+1], ['id=?', id])
      end
    else
      params[:subpages].each_with_index do |id, index|
        Page.update_all(['position=?', index+1], ['id=?', id])
      end
    end
      render :nothing => true
  end
  
  private
    def find_page
      @page = Page.find(params[:id])
    end

end
