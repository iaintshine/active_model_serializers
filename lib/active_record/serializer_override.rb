# We do not recommend that you use AM::S in this way, but if you must, here
# is a mixin that overrides ActiveRecord::Base#to_json and #as_json.

module ActiveRecord
  module SerializerOverride
    def to_json options = {}
      active_model_serializer.new(self, options).to_json
    end

    def as_json options={}
      active_model_serializer.new(self, options).as_json
    end
  end

  Base.send(:include, SerializerOverride)
end
