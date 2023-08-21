class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.text :name
      t.text :description
      t.string :type
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
