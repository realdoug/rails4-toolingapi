require 'restforce'
class ApexClass < Restforce::SObject
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend  ActiveModel::Naming
end