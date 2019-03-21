class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.boolean :active
      t.boolean :accepted
      t.belongs_to :requester, foreign_key: true
      t.belongs_to :requestee, foreign_key: true

      t.timestamps
    end
  end
end
