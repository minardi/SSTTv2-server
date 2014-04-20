class BacklogItemsController < ApplicationController
  before_action :set_backlog_item, only: [:show, :edit, :update, :destroy]
  
 def get_items 
    @backlog_items = BacklogItem.all.where(
	"parent_id=? AND item_type = ? AND status = ?",
	params[:parent_id], params[:item_type], params[:status]) 
	
	 respond_to do |format|
      format.html # get_items.html.erb
      format.json { render json: @backlog_items }
    end
  end
  
  # GET /backlog_items
  # GET /backlog_items.json
  def index
    @backlog_items = BacklogItem.all
  end

  # GET /backlog_items/1
  # GET /backlog_items/1.json
  def show
  end

  # GET /backlog_items/new
  def new
    @backlog_item = BacklogItem.new
  end

  # GET /backlog_items/1/edit
  def edit
  end

  # POST /backlog_items
  # POST /backlog_items.json
  def create
    @backlog_item = BacklogItem.new(backlog_item_params)

    respond_to do |format|
      if @backlog_item.save
        format.html { redirect_to @backlog_item, notice: 'Backlog item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @backlog_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @backlog_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backlog_items/1
  # PATCH/PUT /backlog_items/1.json
  def update
    respond_to do |format|
      if @backlog_item.update(backlog_item_params)
        format.html { redirect_to @backlog_item, notice: 'Backlog item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @backlog_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backlog_items/1
  # DELETE /backlog_items/1.json
  def destroy
    @backlog_item.destroy
    respond_to do |format|
      format.html { redirect_to backlog_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backlog_item
      @backlog_item = BacklogItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backlog_item_params
      params.require(:backlog_item).permit(:title, :description, :estimation, :parent_id, :status, :item_type)
    end
end
