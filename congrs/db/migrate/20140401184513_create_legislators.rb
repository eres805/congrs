class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
    	t.string :title
    	t.string :first_name
    	t.string :middle_name
    	t.string :last_name
    	t.string :term_start
    	t.string :term_end
    	t.string :gender
    	t.string :state
    	t.string :party
    	t.string :contact_form
    	t.string :facebook_id
    	t.string :twitter_id
    	t.string :youtube_id

    	t.string :bioguide_id


    end
  end
end
