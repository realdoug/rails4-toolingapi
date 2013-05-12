module SalesforceUtility
	def self.init_args
		{
			client_id: '3MVG9QDx8IX8nP5RUXIFbi3L4rSVruiBU4O_ozvkJiU0aGZDBxfsF6XDhngJf6Ha2fDNniyDxpt0Gb9Pp.2Tk',
			client_secret: '7712607496533706277',
			username: 'dfriedman@dforce.com',
			password: 'Mavens123',
			api_version: '27.0'
		}
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