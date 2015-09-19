class SettingsController < ApplicationController
  before_action :set_setting_from, only: [:show, :edit, :update, :destroy]

  # GET /settings
  def index
    @settings = Setting.all
    @store_settings = StoreSetting.all
  end

  # GET /settings/1
  def show
  end

  # GET /settings/new
  def new
    @form = SettingForm.new
    @form.setting = Setting.new
    @form.store_setting = StoreSetting.new
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings
  def create
    @form = SettingForm.new
    @form.receive(setting_form_params)

    if @form.valid?
      service = @form.build_create_service
      service.do!
      redirect_to settings_url, notice: 'Setting was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /settings/1
  def update
    @form.attributes(setting_form_params)
    if @form.valid?
      service = @form.build_update_service
      service.do!
      redirect_to settings_url, notice: 'Setting was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /settings/1
  def destroy
    service = @form.build_destroy_service
    service.do!
    redirect_to settings_url, notice: 'Setting was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_setting_from
    @form = SettingForm.new()
    @form.setting = Setting.find(params[:id])
    @form.store_setting = StoreSetting.first # 固定
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def setting_form_params
    params.require(:setting_form).permit(setting: [:name], store_setting: [:store_name, :name])
  end

end
