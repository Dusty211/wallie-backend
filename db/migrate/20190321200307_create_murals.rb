class CreateMurals < ActiveRecord::Migration[5.2]
  def change
    create_table :murals do |t|
      t.string :image
      t.integer :rating
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
