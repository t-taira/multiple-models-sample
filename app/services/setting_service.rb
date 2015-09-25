module SettingService

  class Base < Service::Base
    private
    def do_create_or_update!
      setting = @params[:setting]
      setting.save
      store_setting = @params[:store_setting]
      store_setting.save
    end
  end

  # 登録処理
  class Creator < Base
    private
    def do!
      do_create_or_update!
    end
  end

  # 更新処理
  class Updater < Base
    private
    def do!
      do_create_or_update!
    end
  end

  # 削除処理
  class Destroyer < Base
    private
    def do!
      setting = Setting.find(@params[:setting_id])
      setting.destroy
      store_setting = StoreSetting.first
      store_setting.destroy
    end
  end

end