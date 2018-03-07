class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.text :original
      t.string :key
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :urls, :original
    add_index :urls, :key, unique: true
  end
end
