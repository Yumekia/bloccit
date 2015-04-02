class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :body
      t.string :new_post
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :summaries, :posts
  end
end
