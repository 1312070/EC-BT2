class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.integer :user_id
      t.text :content
      t.timestamps
    end
  end
end
