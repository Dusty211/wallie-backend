class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :job, foreign_key: true
      t.text :content
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
