class Log
  include Mongoid::Document
  
  field :body, :type => String, :default => ""
end
