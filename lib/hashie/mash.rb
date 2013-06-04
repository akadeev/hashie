module Hashie

  class Mash < Hash
    
    def method_missing(meth, *args, &block)
      chopped = meth.to_s.end_with?('=') || meth.to_s.end_with?('!') || meth.to_s.end_with?('?') ? meth.to_s.chop : meth.to_s 
      
      if meth.to_s.end_with?('!')
        define_singleton_method((chopped+'!').to_sym) do |*args|
          if !self[chopped]
            self[chopped] = self.class.new
          end
          self[chopped]
        end
      else 
        define_singleton_method((chopped+'=').to_sym) do |*args|
          self[chopped] = args[0]
        end
        
        define_singleton_method(chopped.to_sym) do |*args|
          self[chopped]
        end
        
        define_singleton_method((chopped+'?').to_sym) do |*args|
          !!self[chopped]
        end
      end

      self.send(meth, *args)
    end

    def respond_to_missing?(method_name, include_private = false)
      true
    end
  end
end