class Cat < Hashie::Trash
  property :first_name, :from => :firstName
  property :last_name, :from => :lastName
end
