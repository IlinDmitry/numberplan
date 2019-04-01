class CreateGermanNumberplans < ActiveRecord::Migration[5.2]
  def change
    create_table :german_numberplans do |t|
      t.integer :prefix
      t.integer :maxlen
      t.integer :minlen
      t.string :usage
      t.string :comment

      t.timestamps
    end
  end
end
