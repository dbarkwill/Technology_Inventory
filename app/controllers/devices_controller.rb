class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy, :clear_history, :device_info, :history_info, :attachments]
  before_action :set_group

  # GET /devices
  # GET /devices.json
  def index

    if params[:group] == 'all'
      @devices = Device.all
      @device_group = DeviceGroup.new
      @device_group.name = "Devices"
    else
      @devices = @device_group.devices.all
    end
    @devices_array = @devices.in_groups(2, false)
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @new_ip = Address.new
    @device_properties_array = @device.device_properties.all.in_groups(2, false)
  end

  def device_info
    respond_to do |format|
      format.js { render :device_info}
    end
  end

  def history_info
    respond_to do |format|
      format.js { render :history_info}
    end
  end

  def attachments
    respond_to do |format|
      format.js { render :attachments}
    end
  end

  # GET /devices/new
  def new
    @device = Device.new
    @device.device_group = @device_group
    @property_list = Array.new
    @device.properties.each do |property|
      @property = DeviceProperty.find_by(:property => property, :device => @device)
      if !@property
        @property = DeviceProperty.new(:property => property, :device => @device)
      end
      @property_list << @property
    end
  end

  # GET /devices/1/edit
  def edit
    @property_list = Array.new
    @device.properties.each do |property|
      @property = DeviceProperty.find_by(:property => property, :device => @device)
      if !@property
        @property = DeviceProperty.new(:property => property, :device => @device)
      end
      @property_list << @property
    end
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)
    @device.device_group = DeviceGroup.find_by(:id => params[:device_group_id])

    params[:device][:device_property].each do |key,value|
      @property = Property.find_by(:id => key)
      DeviceProperty.create(:property => @property, :device => @device, :value => value[:value])
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
    params[:device][:device_property].each do |key, value|
      @device_property = @device.device_properties.find_or_create_by(:property_id => key)
      if @device_property.value != value[:value]
        @device.logs.create(:message => "#{@device_property.property.name} changed from #{@device_property.value} to #{value[:value]}.")
        @device_property.value = value[:value]
        @device_property.save
      end
    end

    if @device.name != params[:device][:name]
      @device.logs.create(:message => "Device name changed from #{@device.name} to #{params[:device][:name]}.")
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

  def clear_history
    @device.logs.each do |log|
      log.destroy
    end
    respond_to do |format|
      format.html { redirect_to device_group_show_path(@device.device_group.name, @device), notice: 'Device history has been cleared.'}
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
      params.require(:device).permit(:name, :asset_tag, :notes, :device_group_id, :status)
    end
end
