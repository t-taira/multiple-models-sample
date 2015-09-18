class StoreSetting < ActiveRecord::Base
  validates :name,  presence: true
end
