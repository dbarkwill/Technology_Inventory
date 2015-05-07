class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :report, :edit, :update, :destroy]
  layout 'report', only: [:report]

  # GET /loans
  # GET /loans.json
  def index
    @open_loans = Loan.where("closed = ?", false)
    @closed_loans = Loan.where("closed = ?", true)
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # GET /loans/report/1
  # GET /loans/report/1.pdf
  def report
  end

  # GET /loans/new
  def new
    @loan = Loan.new
    @loan.loan_line_items.build
  end

  def loan_line_item_fields
    render partial: loan_line_item_fields
  end

  def search_by_sku_or_asset_tag
    asset_tag = Property.find_by_name('Asset Tag')
    @inventoryResults = InventoryItem.search_by_sku(params[:query])
    @devicePropertiesResults = DeviceProperty.find_by_property_id_and_value(asset_tag.id, params[:query])

    if @inventoryResults.count == 1
      render :search_result_inventory, :layout => false, :content_type => 'text/html'
    elsif @devicePropertiesResults
      if @devicePropertiesResults.device.loaned == true
        head 200, content_type: "text/html"
      else
        render :search_result_device, :layout => false, :content_type => 'text/html'
      end
    else
       head 200, content_type: "text/html"
    end
  end

  def lookup
    @inventoryResults = InventoryItem.search(params[:query])
    @deviceResults = Device.search(params[:query])
    @devicePropertyResults = DeviceProperty.search(params[:query])
    @inventoryCategoryResults = InventoryCategory.search(params[:query])
    @results = Array.new
    @inventoryResults.each do |inventory|
      @results << inventory
    end
    @inventoryCategoryResults.each do |inventory_result|
      inventory_result.inventory_items.each do |item|
        unless @results.include? item
          @results << item
        end
      end
    end
    @deviceResults.each do |device|
      @results << device
    end
    @devicePropertyResults.each do |property|
      @deviceResult = property.device
      unless @results.include? @deviceResult
        @results << @deviceResult
      end
    end
    render :lookup_results, :layout => false, :content_type => 'text/html'
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)
    @loan.closed = false

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
        format.js {
          @open_loans = Loan.where("closed = ?", false)
          @closed_loans = Loan.where("closed = ?", true)
          render :create
        }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
        format.js {
          @open_loans = Loan.where("closed = ?", false)
          @closed_loans = Loan.where("closed = ?", true)
          render :create
        }
      end
    end
  end

  # PATCH/PUT /loans/1/close
  def close
    @loan = Loan.find_by_id(params[:id])
    @loan.loan_line_items.each do |line_item|
      if line_item.loanable_type == 'Device'
        line_item.loanable.loaned = false
        line_item.loanable.save
      elsif line_item.loanable_type == 'InventoryItem'
        line_item.loanable.loaned_out_quantity -= line_item.quantity
        line_item.loanable.on_hand_quantity += line_item.quantity
        line_item.loanable.save
      end
      line_item.returned = true
      line_item.save
    end
    @loan.closed = true
    @loan.save
    redirect_to loans_url, notice: 'Loan was successfully closed.'
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
        format.js {
          render :update
        }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
        format.js {
          render :update
        }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:loanee, :notes, :loan_line_items_attributes => [:id, :loan_id, :identifier, :description, :quantity, :loanable_id, :loanable_type, :loan, :loanable, :_destroy])
    end
end
