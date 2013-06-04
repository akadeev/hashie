module Hashie

  class Mash < Hash
    def method_missing(meth, *args, &block)
      method_name = meth.to_s

      key = is_modificator(method_name) ?
        method_name.chop : method_name

      if method_name.end_with?('!')
        define_nested(key)
      else
        define_setter(key)
        define_getter(key)
        define_try(key)
      end

      self.send(meth, *args)
    end

    def respond_to_missing?(method_name, include_private = false)
      true
    end

    def define_nested(key)
      define_singleton_method(:"#{key}!") do
        unless self[key]
          self[key] = self.class.new
        end
        self[key]
      end
    end

    def define_setter(key)
      define_singleton_method(:"#{key}=") do |v|
        self[key] = v
      end
    end

    def define_getter(key)
      define_singleton_method(key) do
        self[key]
      end
    end

    def define_try(key)
      define_singleton_method(:"#{key}?") do
        !!self[key]
      end
    end

    def is_modificator(name)
      name.end_with?('=') ||
      name.end_with?('!') ||
      name.end_with?('?')
    end
  end
end
