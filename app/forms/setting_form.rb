class SettingForm
  include ActiveModel::Model

  attr_accessor :setting, :store_setting

  def valid?
    [@setting.valid?, @store_setting.valid?].all?
  end

  def receive(data)
    @setting = Setting.new(data[:setting])
    @store_setting = StoreSetting.new(data[:store_setting])
  end

  def attributes(setting_form_params)
    @setting.attributes = setting_form_params[:setting]
    @store_setting.attributes = setting_form_params[:store_setting]
  end

  def build_create_service
    SettingService::Creator.new(
      {
        setting: @setting,
        store_setting: @store_setting
      }
    )
  end

  def build_update_service
    SettingService::Updater.new(
      {
        setting: @setting,
        store_setting: @store_setting
      }
    )
  end

  def build_destroy_service
    SettingService::Destroyer.new(
      {
        setting_id: @setting.id,
      }
    )
  end

  def persisted?
    setting.persisted?
  end

  def url
    if setting.persisted?
      Rails.application.routes.url_helpers.setting_path(setting)
    else
      Rails.application.routes.url_helpers.settings_path
    end
  end

  def method
    setting.persisted? ? :put : :post
  end
end