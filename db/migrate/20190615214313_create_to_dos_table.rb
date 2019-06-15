class CreateToDosTable < ActiveRecord::Migration[5.2]
  def change
    create_table :to_dos do |t|
      t.string :name
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :list, index: true, foreign_key: true

      t.timestamps
    end
  end
end
