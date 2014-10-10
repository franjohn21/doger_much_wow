class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user
      t.references :followee

      t.timestamps
    end
  end
end
