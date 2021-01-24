class CreateConcerts < ActiveRecord::Migration[6.0]
  def change
    create_table :concerts do |t|
      t.string :place
      t.integer :participants
      t.date :date
      t.integer :duration
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
