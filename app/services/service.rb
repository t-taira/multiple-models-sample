module Service
  class Base
    def initialize(params)
      @params = params
    end

    def execute!
      ActiveRecord::Base.transaction do
        do!
      end
    end

    private
    def do!
      return
    end
  end
end