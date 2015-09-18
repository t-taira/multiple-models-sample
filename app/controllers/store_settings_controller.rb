class StoreSettingsController < ApplicationController
  before_action :set_store_setting, only: [:show, :edit, :update, :destroy]

  # GET /store_settings
  # GET /store_settings.json
  def index
    @store_settings = StoreSetting.all
  end

  # GET /store_settings/1
  # GET /store_settings/1.json
  def show
  end

  # GET /store_settings/new
  def new
    @store_setting = StoreSetting.new
  end

  # GET /store_settings/1/edit
  def edit
  end

  # POST /store_settings
  # POST /store_settings.json
  def create
    @store_setting = StoreSetting.new(store_setting_params)

    respond_to do |format|
      if @store_setting.save
        format.html { redirect_to @store_setting, notice: 'Store setting was successfully created.' }
        format.json { render :show, status: :created, location: @store_setting }
      else
        format.html { render :new }
        format.json { render json: @store_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_settings/1
  # PATCH/PUT /store_settings/1.json
  def update
    respond_to do |format|
      if @store_setting.update(store_setting_params)
        format.html { redirect_to @store_setting, notice: 'Store setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_setting }
      else
        format.html { render :edit }
        format.json { render json: @store_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_settings/1
  # DELETE /store_settings/1.json
  def destroy
    @store_setting.destroy
    respond_to do |format|
      format.html { redirect_to store_settings_url, notice: 'Store setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_setting
      @store_setting = StoreSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_setting_params
      params.require(:store_setting).permit(:name, :store_name)
    end
end
