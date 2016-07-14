class CreateDutiesTable < ActiveRecord::Migration
	def self.up
		create_table :duties do |table|
			table.string :username, null: false
			table.boolean :morning_greeting,default: false
			table.boolean :evening_greeting,default: false
		end
		add_index :duties,:username,unique: true
	end
end
