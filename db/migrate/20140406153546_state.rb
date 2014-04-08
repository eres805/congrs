class State < ActiveRecord::Migration
  def change
  	create_table :states do |t|
  		t.string :state_name
  		t.string :state
  	end
  end
end
