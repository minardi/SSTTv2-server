class BacklogItemsController < ApplicationController
  before_action :set_backlog_item, only: [:show, :edit, :update, :destroy]

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
    @backlog_item = BacklogItem.new(backlog_item_all_params)
    
    if @backlog_item.item_type == "sprint"
      if params.has_key?("start_date") && params.has_key?("end_date")
        @backlog_item.info = {start_date: params[:start_date], end_date: params[:end_date]}.to_json
      else
        #@backlog_item.info = params[:info]
      end
    end

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
    if @backlog_item.item_type == "sprint"
      if params.has_key?("start_date") && params.has_key?("end_date")
        @backlog_item.update(info: {start_date: params[:start_date], end_date: params[:end_date]}.to_json)
      else
        #@backlog_item.update(info: params[:info])
      end
    end

    respond_to do |format|
      if @backlog_item.update(backlog_item_all_params)
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
  
  # GET /backlog_items/get_items/:item_type/:status/:parent_id
  def get_items
    @backlog_items = BacklogItem.where(
		  "item_type =? AND status=? AND parent_id=?",
		  params[:item_type], params[:status], params[:parent_id]
    )

	  @backlog_items.each do |backlog_item|
      
      if backlog_item.item_type == "sprint"
        info = ActiveSupport::JSON.decode(backlog_item[:info])
        backlog_item[:info] = info
      end
    end
  end

  def get_active_sprint
    @backlog_item = BacklogItem.where(
      "item_type ='sprint' AND status='active' AND parent_id=?",
      params[:parent_id]
    ).take
    
    if @backlog_item
      info = ActiveSupport::JSON.decode(@backlog_item[:info])
      @backlog_item[:info] = info
    end
  end
  
  def get_tasks
    @sprint_id = params[:sprint_id]
	
  	@stories = BacklogItem.where(
  		"item_type = ? AND status = ? AND parent_id = ?",
  		"story", "sprint",	@sprint_id
  	)

    @stories_without_task = BacklogItem.where(
      "item_type = ? AND (status = ? OR status = ? OR status = ? OR status = ?) AND parent_id = ?",
      "story", "todo", "progress", "verify", "done",  @sprint_id
    )
	
  	@all_tasks = []

  	@stories.each do |story|
  		@tasks = BacklogItem.where(
    		"item_type = ? AND parent_id=?",
    		"task", story.id
  		)
    	
      @all_tasks.push(@tasks)
  	end
	  
    @all_tasks.push(@stories_without_task)

    @all_tasks = @all_tasks.flatten
	
	  respond_to do |format|
      format.json { render json:  @all_tasks }
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

    def backlog_item_all_params
      params.require(:backlog_item).permit(:title, :description, :estimation, :parent_id, :status, :item_type, :info)
    end

end
