module Hashie

  class Mash < Hash
    def method_missing(meth, *args, &block)
      define_singleton_method(meth) do |*args|
        key = meth.to_s.chop
        if args && args.any?
          self[key] = args.first
        else
          if meth.to_s.end_with? '!'
            self[key] = self.class.new
          end
          self[key]
        end
      end
      self.send(meth, *args)
    end
  end
end
