class TagsController < ApplicationController
  load_and_authorize_resource

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @q = @tag.items.search(params[:q])
    @items = @q.result(:distinct => true)

    @booking = current_user.booking
    render 'items/index'
  end

  # GET /tags/new
  # GET /tags/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    respond_to do |format|
      if @tag.save
        format.html { redirect_to Tag, notice: 'Tag was successfully created.' }
        format.json { render json: @tag, status: :created, location: @tag }
      else
        format.html { render action: "new" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to Tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to Tag }
      format.json { head :no_content }
    end
  end
end
