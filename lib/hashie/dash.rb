module Hashie
  class Dash
    def initialize()
      @attrs = {}
      @values = {}
    end

    def self.property(name, attrs = {})
      @attrs[name] = attrs
      if (attrs && attrs[:default])
        @values[name] = attrs[:default]
      end

      define_method(name + '=') do |*args|
        if (@data[name][:required] && !args.first)
          raise ArgumentError.new("#The property {name} is required for this Dash")
        end
        @values[name] = args.first
      end
      define_method(name) do
        @values[name]
      end

    end
  end
end
