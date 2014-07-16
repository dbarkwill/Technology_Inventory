class NetworksController < ApplicationController
  before_action :set_network, only: [:show, :edit, :update, :destroy]

  # GET /networks
  # GET /networks.json
  def index
    @networks = Network.all
  end

  # GET /networks/1
  # GET /networks/1.json
  def show
    @ip_list = IPAddress(@network.network)
    @devices = @network.devices.all
    @device_groups = DeviceGroup.all.map { |group| [group.name, group.id] }
  end

  # GET /networks/new
  def new
    @network = Network.new
  end

  def add_address
    @device = Device.find_by(:id => params[:device_id])
    @address = Address.new(:address => params[:address])
    @network = Network.find_by(:id => params[:network_id])
    @address.device = @device
    @address.network = @network
    
    if @device
      respond_to do |format|
        if @address.save
          format.html { redirect_to @network, notice: 'Device added to address.' }
        else
          format.html { redirect_to @network, error: 'Problem adding device to address. Try again.' }
        end
      end
    else
      redirect_to @network, error: 'Problem adding device to address. Try again.' 
    end
  end

  def get_device_list
    @devices = DeviceGroup.find_by(:id => params[:device_group]).devices.all
    @device_list = @devices.all.map { |device| [device.name, device.id]}
  end

  # GET /networks/1/edit
  def edit
  end

  # POST /networks
  # POST /networks.json
  def create
    @network = Network.new(network_params)

    respond_to do |format|
      if @network.save
        format.html { redirect_to @network, notice: 'Network was successfully created.' }
        format.json { render :show, status: :created, location: @network }
        format.js {
          @networks = Network.all
          render :create
        }
      else
        format.html { render :new }
        format.json { render json: @network.errors, status: :unprocessable_entity }
        format.js {
          @networks = Network.all
          render :create
        }
      end
    end
  end

  # PATCH/PUT /networks/1
  # PATCH/PUT /networks/1.json
  def update
    respond_to do |format|
      if @network.update(network_params)
        format.html { redirect_to @network, notice: 'Network was successfully updated.' }
        format.json { render :show, status: :ok, location: @network }
      else
        format.html { render :edit }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /networks/1
  # DELETE /networks/1.json
  def destroy
    @network.destroy
    respond_to do |format|
      format.html { redirect_to networks_url, notice: 'Network was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network
      @network = Network.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_params
      params.require(:network).permit(:name, :network, :vlan, :description)
    end
end
