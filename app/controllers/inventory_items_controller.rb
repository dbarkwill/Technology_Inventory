class InventoryItemsController < ApplicationController
  before_action :set_inventory_item, only: [:show, :edit, :update, :destroy, :enter_serial_numbers]

  # GET /inventory_items
  # GET /inventory_items.json
  def index
    if params[:category]
      @inventory_items = InventoryItem.where(:inventory_category_id => params[:category])
    else
      @inventory_items = InventoryItem.all
    end
    
  end

  # GET /inventory_items/1
  # GET /inventory_items/1.json
  def show
  end

  # GET /inventory_items/search_by_sku{sku}
  def search_by_sku
    @results = InventoryItem.search_by_sku(params[:sku])
    if @results.count == 1
      render :sku_result, :layout => false, :content_type => 'text/html'
    else
      head 200, content_type: "text/html"
    end
  end

  # GET /inventory_items/new
  def new
    @inventory_item = InventoryItem.new
  end

  # GET /inventory_items/1/enter_serial_numbers
  def enter_serial_numbers
  end

  # AJAX POST /inventory_items/receive
  def receive
    params[:receiving].each do |receive|
      unless receive[:sku].blank?
        inventory_item = InventoryItem.find_by_sku(receive[:sku])
        inventory_item.update_attributes({'on_hand_quantity' => inventory_item.on_hand_quantity.to_i + receive[:amount].to_i})
      end
    end
    @inventory_items = InventoryItem.all
  end

  # GET /inventory_items/1/edit
  def edit
  end

  # POST /inventory_items
  # POST /inventory_items.json
  def create
    @inventory_item = InventoryItem.new(inventory_item_params)
    @inventory_item.serial_numbers = Array.new
    @inventory_item.on_hand_quantity = 0
    @inventory_item.loaned_out_quantity = 0
    @inventory_item.in_use_quantity = 0

    respond_to do |format|
      if @inventory_item.save
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item }
        format.js {
          index
          render :create
        }
      else
        format.html { render :new }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
        format.js {
          index
          render :create
        }
      end
    end
  end

  # PATCH/PUT /inventory_items/1
  # PATCH/PUT /inventory_items/1.json
  def update
    respond_to do |format|
      if @inventory_item.update(inventory_item_params)
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @inventory_item = InventoryItem.find_by_id(params[:inventory_item_id])
  end

  # DELETE /inventory_items/1
  # DELETE /inventory_items/1.json
  def destroy
    @inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to inventory_items_url, notice: 'Inventory item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item
      @inventory_item = InventoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_item_params
      params.require(:inventory_item).permit(:sku, :name, :description, :cost, :on_hand_quantity, :loaned_out_quantity, :in_use_quantity, :serial_numbers, :inventory_category_id, :new_inventory_category_name, :serial_required, :raw_serial_number_list)
    end
end
