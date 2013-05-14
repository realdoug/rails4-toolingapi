module SalesforceUtility
	def self.init_args
    YAML.load_file("config/salesforce.yml")[Rails.env]
	end
end

class Restforce::SObject
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  def to_param
    self.Id
  end

  def to_key
  	[self.Id]
  end

  def id
  	self.Id
  end
  
  def is_persisted?
  	!(self.Id.class == NilClass)
  end

  def self.model_name
  	ApexClass
  end
end