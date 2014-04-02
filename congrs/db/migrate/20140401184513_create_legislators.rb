class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :state
    	t.string :party
    	t.string :bioguide_id
    end
  end
end
