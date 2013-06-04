module Hashie

  class Mash < Hash

    def should_define_setter(meth, args)
      meth.to_s.end_with?('=') && args && args.any?
    end

    def is_nested(meth)
      meth.to_s.end_with?('!')
    end

    def method_missing(meth, *args, &block)
      define_singleton_method(meth) do |*args|
        if should_define_setter(meth, args)
          # name=
          # 1. remove =
          # 2. save to hash
          self[meth.to_s.chop] = args.first
          p 'setter'
          p self.inspect
        else
          # this is a getter
          if is_nested(meth)
            # obj.a!.b
            # 1. do not remove anything from method name
            # 2. save to hash
            self[meth] = self.class.new

          end
          p 'getter'
          p self.inspect

          self[meth]
        end
      end

      self.send(meth, *args)
    end

    # def respond_to_missing?(method_name, include_private = false)
    #   self.key?(method_name)
    # end
  end
end
