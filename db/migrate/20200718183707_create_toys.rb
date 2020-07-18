class CreateToys < ActiveRecord::Migration[5.2]
  def change
    create_table :toys do |t|
      t.integer :dog_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
