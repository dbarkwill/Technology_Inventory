class AttrsController < ApplicationController
  before_action :set_attr, only: [:show, :edit, :update, :destroy]

  # GET /attrs
  # GET /attrs.json
  def index
    @attrs = Attr.all
  end

  # GET /attrs/1
  # GET /attrs/1.json
  def show
  end

  # GET /attrs/new
  def new
    @attr = Attr.new
  end

  # GET /attrs/1/edit
  def edit
  end

  # POST /attrs
  # POST /attrs.json
  def create
    @attr = Attr.new(attr_params)

    @attr.device_group = DeviceGroup.find_by_id(params[:device_group_id])

    respond_to do |format|
      if @attr.save
        format.html { redirect_to @attr.device_group, notice: 'Attr was successfully created.' }
        format.json { render :show, status: :created, location: @attr }
      else
        format.html { render :new }
        format.json { render json: @attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attrs/1
  # PATCH/PUT /attrs/1.json
  def update
    respond_to do |format|
      if @attr.update(attr_params)
        format.html { redirect_to @attr, notice: 'Attr was successfully updated.' }
        format.json { render :show, status: :ok, location: @attr }
      else
        format.html { render :edit }
        format.json { render json: @attr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attrs/1
  # DELETE /attrs/1.json
  def destroy
    @attr.destroy
    respond_to do |format|
      format.html { redirect_to attrs_url, notice: 'Attr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attr
      @attr = Attr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attr_params
      params.require(:attr).permit(:name, :device_group_id, :style, :unit, :values)
    end
end
