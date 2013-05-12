require 'restforce'
class ApexClass < Restforce::SObject
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
  attr_accessor :Name, :Body

  def self.param_key
  	"apex_class"
  end
end