class UserModule < ApplicationRecord
	self.table_name = "user_module"
	has_many  :address
end