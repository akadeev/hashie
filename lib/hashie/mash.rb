module Hashie

  class Mash < Hash
    def method_missing(meth, *args, &block)
      define_singleton_method(meth) do |*args|
        if args && !args.empty?
          self[meth.to_s.chop] = args.first
        else
          self[meth.to_s]
        end
      end
      self.send(meth, *args)
    end
  end
end
