module SettingService

  class Base
    def initialize(params)
      @params = params
    end
  end

  # 登録処理
  class Creator < SettingService::Base
    def do!
      Setting.transaction do
        setting = @params[:setting]
        setting.save

        store_setting = @params[:store_setting]
        store_setting.save
      end
    end
  end

  # 更新処理
  class Updater < SettingService::Base
    def do!
      Setting.transaction do
        setting = @params[:setting]
        setting.save

        store_setting = @params[:store_setting]
        store_setting.save
      end
    end
  end

  # 削除処理
  class Destroyer < SettingService::Base
    def do!
      Setting.transaction do
        setting = Setting.find(@params[:setting_id])
        setting.destroy

        store_setting = StoreSetting.first
        store_setting.destroy
      end
    end
  end

end