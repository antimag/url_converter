class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :given_url
      t.string :short_url
      t.integer :user_id
      t.timestamps
    end
  end
end
