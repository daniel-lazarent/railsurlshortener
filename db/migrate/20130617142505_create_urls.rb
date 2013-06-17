class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url, :null => false
	  t.integer :count, :null => false, :default => 0
	  #t.string :short_url, :null => false
      t.string :key, :null => false
	  t.timestamps
    end
	add_index :urls, :key
  end
end