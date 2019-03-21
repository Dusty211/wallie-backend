class CreateWalls < ActiveRecord::Migration[5.2]
  def change
    create_table :walls do |t|
      t.string :location
      t.string :image
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
