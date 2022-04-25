class CreateYears < ActiveRecord::Migration[7.0]
  def change
    create_table :years do |t|
      t.string :year
      t.belongs_to :model, null: false, foreign_key: true
      t.belongs_to :make, null: false, foreign_key: true

      t.timestamps
    end
  end
end
