module Hashie
  # TODO: Override indexer & add test

  class Dash
    def initialize(data = {})
      @values = self.class.values
      @attrs = self.class.attrs

      data.each do |k, v|
        @values[k] = v
      end
    end

    def self.property(name, attrs = {})
      @attrs ||= {}
      @values ||= {}
      @attrs[name] = attrs
      if (attrs && attrs[:default])
        @values[name] = attrs[:default]
      end

      define_method((name.to_s + '=').to_sym) do |*args|
        if (@attrs[name][:required] && args && !args.first)
          raise ArgumentError.new("#The property {name} is required for this Dash")
        end
        @values[name] = args.first
      end
      define_method(name) do
        @values[name]
      end

    end

    def self.attrs
      @attrs
    end

    def self.values
      @values
    end
  end
end
