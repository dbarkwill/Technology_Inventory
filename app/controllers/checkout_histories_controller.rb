class CheckoutHistoriesController < ApplicationController
  before_action :set_checkout_history, only: [:show, :edit, :update, :destroy, :checkin]

  # GET /checkout_histories
  # GET /checkout_histories.json
  def index
    @checkout_histories = CheckoutHistory.where(:checked_in => false)
  end

  # GET /checkout_histories/1
  # GET /checkout_histories/1.json
  def show
  end

  # GET /checkout_histories/new
  def new
    @checkout_history = CheckoutHistory.new
    @dgs = Array.new
    DeviceGroup.all.each do |dg|
      @dgs << dg if dg.devices.count > 0
    end
    @device_groups = @dgs.each.map { |dg| [dg.name, dg.id] }
  end

  def checkin
    @checkout_history.checked_in = true
    @device = @checkout_history.device
    @device.checkedout = false
    @device.save
    @device.logs.create(:message => "Device returned.")

    respond_to do |format|
      if @checkout_history.save
        format.html { redirect_to(:controller => 'devices', :action => 'show', :group => @device.device_group.name, :id => @device) }
        format.json { render :show, status: :created, location: @checkout_history }
      else
        format.html { render :new }
        format.json { render json: @checkout_history.errors, status: :unprocessable_entity }
      end
    end

  end

  def device_group_select
    @checkout_history = CheckoutHistory.new
    @device_group = DeviceGroup.find_by(:id => params[:device_type])
    @devices = @device_group.devices.all.map { |d| [d.name, d.id]}
  end

  # POST /checkout_histories
  # POST /checkout_histories.json
  def create
    @checkout_history = CheckoutHistory.new(checkout_history_params)

    @device = @checkout_history.device

    @device.checkedout = true
    @device.logs.create(:message => "Device loaned to #{@checkout_history.name}")
    @device.save

    @checkout_history.checked_in = false

    respond_to do |format|
      if @checkout_history.save
        if params[:redir]
          format.html { redirect_to(:controller => 'devices', :action => 'show', :group => @device.device_group.name, :id => @device) }
        else
          format.html { redirect_to checkout_histories_url, notice: 'Checkout history was successfully created.' }
          format.json { render :show, status: :created, location: @checkout_history }
        end
      else
        format.html { render :new }
        format.json { render json: @checkout_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkout_histories/1
  # PATCH/PUT /checkout_histories/1.json
  

  # DELETE /checkout_histories/1
  # DELETE /checkout_histories/1.json
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout_history
      @checkout_history = CheckoutHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkout_history_params
      params.require(:checkout_history).permit(:device_id, :name, :notes)
    end
end
