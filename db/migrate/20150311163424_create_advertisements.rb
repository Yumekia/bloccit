class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements, force:true do |t|
      t.string :title
      t.text :copy
      t.integer :price
      t.integer :post_id
      
      t.timestamps null: false
    end
   
  end
end
