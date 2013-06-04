module Hashie
  class Clash < Hash

    def method_missing(meth, *args, &block)

      if (args && args.any?)
        arg = args.first
        if arg.is_a?(Hash)
          self[meth] = Clash.new(arg)
          return self
        else
          self[meth] = arg
        end
      end
      self[meth]
    end

    def respond_to_missing?(method_name, include_private = false)
      true
    end
  end
end
