class CreateDoges < ActiveRecord::Migration
  def change
  	create_table :doges do |t|
  		t.string :content
  		t.references :user
  		t.timestamps
  	end
  end
end
