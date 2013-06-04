module Hashie
  # TODO: Override indexer & add test

  class Dash
    def initialize(data = {})
      @inst_values = self.class.values.dup
      @inst_attrs = self.class.attrs.dup

      data.each do |k, v|
        self.send(:"#{k}=", v)
      end

      validate
    end

    def self.property(name, attrs = {})
      @attrs ||= {}
      @values ||= {}

      @attrs[name] = attrs
      if (attrs && attrs[:default])
        @values[name] = attrs[:default]
      end

      # setter
      define_method(:"#{name}=") do |v|
        if (@inst_attrs[name][:required] && v.nil?)
          raise_required(name)
        end
        @inst_values[name] = v
      end
      # getter
      define_method(name) do
        @inst_values[name]
      end

    end

    def self.attrs
      @attrs
    end

    def self.values
      @values
    end

    def validate
      # TODO: replace with some method,
      # that is already included in ruby core

      @inst_attrs.each do |k, v|
        if (v[:required] && @inst_values[k].nil?)
          raise_required(k)
        end
      end
    end

    def raise_required(name)
      raise ArgumentError.new("The property #{name} is required for this Dash")
    end
  end
end
