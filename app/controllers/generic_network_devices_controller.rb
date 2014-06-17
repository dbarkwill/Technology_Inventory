class GenericNetworkDevicesController < ApplicationController
  before_action :set_generic_network_device, only: [:show, :edit, :update, :destroy]

  # GET /generic_network_devices
  # GET /generic_network_devices.json
  def index
    @generic_network_devices = GenericNetworkDevice.all
  end

  # GET /generic_network_devices/1
  # GET /generic_network_devices/1.json
  def show
  end

  # GET /generic_network_devices/new
  def new
    @generic_network_device = GenericNetworkDevice.new
  end

  # GET /generic_network_devices/1/edit
  def edit
  end

  # POST /generic_network_devices
  # POST /generic_network_devices.json
  def create
    @generic_network_device = GenericNetworkDevice.new(generic_network_device_params)

    respond_to do |format|
      if @generic_network_device.save
        format.html { redirect_to @generic_network_device, notice: 'Generic network device was successfully created.' }
        format.json { render :show, status: :created, location: @generic_network_device }
      else
        format.html { render :new }
        format.json { render json: @generic_network_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generic_network_devices/1
  # PATCH/PUT /generic_network_devices/1.json
  def update
    respond_to do |format|
      if @generic_network_device.update(generic_network_device_params)
        format.html { redirect_to @generic_network_device, notice: 'Generic network device was successfully updated.' }
        format.json { render :show, status: :ok, location: @generic_network_device }
      else
        format.html { render :edit }
        format.json { render json: @generic_network_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generic_network_devices/1
  # DELETE /generic_network_devices/1.json
  def destroy
    @generic_network_device.destroy
    respond_to do |format|
      format.html { redirect_to generic_network_devices_url, notice: 'Generic network device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generic_network_device
      @generic_network_device = GenericNetworkDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def generic_network_device_params
      params.require(:generic_network_device).permit(:name, :MAC, :description)
    end
end
