class Admin::DeviceGroupsController < ApplicationController
  before_action :set_device_group, only: [:show, :edit, :update, :destroy]

  # GET /device_groups
  # GET /device_groups.json
  def index
    @device_groups = DeviceGroup.all
  end

  # GET /device_groups/1
  # GET /device_groups/1.json
  def show
  end

  # GET /device_groups/new
  def new
    @device_group = DeviceGroup.new
  end

  # GET /device_groups/1/edit
  def edit
  end

  # GET /device_groups/1/add_property
  def add_property
    @device_group = DeviceGroup.find_by_id(params[:device_group_id])
    p = Array.new
    Property.all.each do |property|
      p << property unless @device_group.properties.all.exists? property
    end
    @properties_array = p.in_groups(3, false)
  end

  def create_property
    @device_group = DeviceGroup.find_by_id(params[:device_group_id])
  end

  # POST /device_groups
  # POST /device_groups.json
  def create
    @device_group = DeviceGroup.new(device_group_params)

    respond_to do |format|
      if @device_group.save
        format.html { redirect_to @device_group, notice: 'Device group was successfully created.' }
        format.json { render :show, status: :created, location: @device_group }
        format.js {
          @device_groups = DeviceGroup.all
          render :create
        }
      else
        format.html { render :new }
        format.json { render json: @device_group.errors, status: :unprocessable_entity }
        format.js {
          @device_groups = DeviceGroup.all
          render :create
        }
      end
    end
  end

  # PATCH/PUT /device_groups/1
  # PATCH/PUT /device_groups/1.json
  def update
    if params[:device_group][:property_ids]
      params[:device_group][:property_ids].each do |property_id|
          @property = Property.find(property_id)
          @device_group.properties << @property
      end
    end
    respond_to do |format|
      if @device_group.update(device_group_params)
        format.html { redirect_to @device_group, notice: 'Device group was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_group }
        format.js {
          @device_groups = DeviceGroup.all
          render :update
        }
      else
        format.html { render :edit }
        format.json { render json: @device_group.errors, status: :unprocessable_entity }
        format.js {
          @device_groups = DeviceGroup.all
          render :update
        }
      end
    end
  end

  def delete
    @device_group = DeviceGroup.find(params[:device_group_id])
  end

  # DELETE /device_groups/1
  # DELETE /device_groups/1.json
  def destroy
    @device_group.destroy
    respond_to do |format|
      format.html { redirect_to device_groups_url, notice: 'Device group was successfully destroyed.' }
      format.json { head :no_content }
      format.js {
          @device_groups = DeviceGroup.all
          render :update
        }
    end
  end

  def remove_property
    @property = Property.find(params[:property_id])
    @device_group = DeviceGroup.find(params[:device_group_id])
    @device_group.properties.delete(@property)
    respond_to do |format|
      format.js {
        render :refresh_properties
      }
    end
  end

  def remove_property_from_all
    @property = Property.find(params[:property_id])
    @device_group = DeviceGroup.find(params[:device_group_id])
    @device_group.properties.delete(@property)
    @property.device_properties.each do |device_property|
      device_property.destroy
    end
    respond_to do |format|
      format.js {
        render :refresh_properties
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_group
      @device_group = DeviceGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_group_params
      params.require(:device_group).permit(:name, properties_attributes: [:id, :name, :style, :unit, :values, :fa_style])
    end
end
