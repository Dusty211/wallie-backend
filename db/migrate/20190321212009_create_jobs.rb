class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.boolean :active
      t.boolean :accepted
      t.string :title
      t.belongs_to :requester
      t.belongs_to :requestee

      t.timestamps
    end
  end
end
