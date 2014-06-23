class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :set_group

  # GET /devices
  # GET /devices.json
  def index
    @devices = @device_group.devices.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @new_ip = Address.new
  end

  # GET /devices/new
  def new
    @device = Device.new
    @device.device_group = @device_group
    @attr_list = Array.new
    @device.attrs.each do |property|
      @prop = AttrDevice.find_by(:attr => property, :device => @device)
      if !@prop
        @prop = AttrDevice.new(:attr => property, :device => @device)
      end
      @attr_list << @prop
    end
  end

  # GET /devices/1/edit
  def edit
    @attr_list = Array.new
    @device.attrs.each do |property|
      @prop = AttrDevice.find_by(:attr => property, :device => @device)
      if !@prop
        @prop = AttrDevice.new(:attr => property, :device => @device)
      end
      @attr_list << @prop
    end
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)
    @device.device_group = DeviceGroup.find_by(:id => params[:device_group_id])

    params[:attr].each do |key,value|
      @attr = Attr.find_by(:id => key)
      @attr_device = AttrDevice.create(:attr => @attr, :device => @device, :value => value)
    end

    respond_to do |format|
      if @device.save
        @device.logs.create(:message => "Device created.")
        format.html { redirect_to(:controller => 'devices', :action => 'show', :group => @device.device_group.name, :id => @device)}
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    params[:attr].each do |key,value|
      @attr = @device.attr_devices.find_or_create_by(:attr_id => key)
      if @attr.value != value
        @device.logs.create(:message => "#{@attr.attr.name} changed from #{@attr.value} to #{value}")
        @attr.value = value
        @attr.save
      end
      
    end
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to(:controller => 'devices', :action => 'show', :group => @device.device_group.name, :id => @device)}
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to device_types_path(@device_group.name), notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    def set_group
      @device_group = DeviceGroup.find_by(:name => params[:group])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name, :asset_tag, :notes, :device_group_id)
    end
end
