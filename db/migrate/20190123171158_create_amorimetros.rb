class CreateAmorimetros < ActiveRecord::Migration[5.1]
  def change
    create_table :amorimetros do |t|
      t.integer :points
      t.integer :user_id
      t.string :reason

      t.timestamps
    end
  end
end
