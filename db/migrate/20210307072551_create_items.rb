class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :condition_id, null: false
      t.integer :mailing_cost_id, null: false
      t.integer :mailer_loc_id, null: false
      t.integer :days_til_post_id, null: false
      t.integer :category_id, null: false
      t.boolean :in_stock, null: false, default: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
