class UserModule < ApplicationRecord
	self.table_name = "user_module"
	has_many :user_resource
end