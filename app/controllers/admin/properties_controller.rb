class Admin::PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to admin_property_path(@property), notice: 'Property was successfully created.' }
        format.js {
          @properties = Property.all
          render :create
        }
      else
        format.html { render :new }
        format.js {
          @properties = Property.all
          render :create
        }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to admin_property_path(@property), notice: 'Property was successfully updated.' }
        format.js {
          @properties = Property.all
          render :update
        }
      else
        format.html { render :edit }
        format.js {
          @properties = Property.all
          render :update
        }
      end
    end
  end

  def delete
    @property = Property.find(params[:property_id])
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to admin_properties_path, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
      format.js {
          @properties = Property.all
          render :update
        }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:name, :style, :unit, :values, :fa_style)
    end
end
