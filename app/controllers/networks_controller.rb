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
    @network_ips = @network.addresses
  end

  # GET /networks/new
  def new
    @network = Network.new
  end

  def add_address
    @network = Network.find(params[:network_id])

    device_groups = Array.new
      DeviceGroup.all.each do |device_group|
        device_groups << device_group if device_group.devices.count > 0
      end
      @device_groups = device_groups.each.map { |device_group| [device_group.name, device_group.id] }
  end

  def save_address
    
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
        format.js { 
          @ip_list = IPAddress(@network.network)
          @network_ips = @network.addresses
          render :update
        }
      else
        format.html { render :edit }
        format.json { render json: @network.errors, status: :unprocessable_entity }
        format.js { 
          render :update
        }
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
      params.require(:network).permit(:name, :network, :vlan, :description, addresses_attributes: [:id, :address, :device_id, :network_id, :device, :network])
    end
end
