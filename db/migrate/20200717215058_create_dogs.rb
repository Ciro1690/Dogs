class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
