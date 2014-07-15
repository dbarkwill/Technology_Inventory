class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)
    @device = Device.find_by(id: params[:device_id])

    @address.device = @device

    respond_to do |format|
      if validate_ip(@address.network, @address.address)
        if @address.save
          format.html { redirect_to(:controller => 'devices', :action => 'show', :group => @device.device_group.name, :id => @device) }
          format.json { render :show, status: :created, location: @address }
        else
          format.html { render :new }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      else
        format.html { 
          flash[:error] = 'Address is not valid for that network'
          redirect_to :controller => 'devices', :action => 'show', :group => @device.device_group.name, :id => @device
        }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to(:controller => 'devices', :action => 'show', :group => @device.device_group.name, :id => @device) }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
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
