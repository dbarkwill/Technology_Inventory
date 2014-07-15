class AddressesController < ApplicationController
  before_action :set_address, only: [:destroy]

 

  # GET /addresses/new
  def new
    @address = Address.new
    @device = Device.find_by(:id => params[:device_id])
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)
    @device = Device.find_by(id: params[:device_id])

    @address.device = @device

    respond_to do |format|
      if @address.save
        format.html { redirect_to(:controller => 'devices', :action => 'show', :group => @device.device_group.name, :id => @device) }
        format.json { render :show, status: :created, location: @address }
        format.js { render :create }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
        format.js { render :create }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @device = @address.device
    @address.destroy
    respond_to do |format|
      format.html { redirect_to(:controller => 'devices', :action => 'show', :group => @device.device_group.name, :id => @device) }
      format.json { head :no_content }
      format.js { render :destroy}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:address, :device_id, :network_id)
    end

    def validate_ip(network, ip)
      ip_network = IPAddress(network.network)
      begin temp_ip = IPAddress(ip)
        ip_network.include?(temp_ip)
      rescue ArgumentError
        nil
      end
    end
end
