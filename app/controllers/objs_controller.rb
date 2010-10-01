class ObjsController < ApplicationController
  # GET /objs
  # GET /objs.xml
  def index
    @objs = Obj.all
   

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @objs }
    end
  end

  # GET /objs/1
  # GET /objs/1.xml
  def show
    @obj = Obj.find(params[:id])
	@current_user = User.find_by_id(session[:user_id]) if session[:user_id]
    session[:custom_uri]= obj_path(@obj)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @obj }
    end
  end

  # GET /objs/new
  # GET /objs/new.xml
  def new
    @obj = Obj.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @obj }
    end
  end

  # GET /objs/1/edit
  def edit
    @obj = Obj.find(params[:id])
  end

  # POST /objs
  # POST /objs.xml
  def create
    @obj = Obj.new(params[:obj])

    respond_to do |format|
      if @obj.save
        format.html { redirect_to(@obj, :notice => 'Obj was successfully created.') }
        format.xml  { render :xml => @obj, :status => :created, :location => @obj }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @obj.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /objs/1
  # PUT /objs/1.xml
  def update
    @obj = Obj.find(params[:id])

    respond_to do |format|
      if @obj.update_attributes(params[:obj])
        format.html { redirect_to(@obj, :notice => 'Obj was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @obj.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /objs/1
  # DELETE /objs/1.xml
  def destroy
    @obj = Obj.find(params[:id])
    @obj.destroy

    respond_to do |format|
      format.html { redirect_to(objs_url) }
      format.xml  { head :ok }
    end
  end
end
