module Hashie
  class Trash < Dash
    def initialize(data = {})
      super(data)
      # WTF i sup 2do here
    end

    class << self
      def property(name, attrs = {})
        translated = attrs[:from]
        if translated
          define_method(:"#{translated}=") do |v|
            self.send(:"#{name}=", v)
          end
          define_method(translated) do
            self.send(:"#{name}")
          end
        end
        super(name, attrs)
      end
    end

  end
end
