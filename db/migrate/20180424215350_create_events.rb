class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :user,   foreign_key: true
      t.string :title
      t.string :description
      t.time :starts_at
      t.time :ends_at
      t.string :day

      t.timestamps
    end
  end
end
