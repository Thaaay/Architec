class CreateHotspots < ActiveRecord::Migration[8.0]
  def change
    create_table :hotspots do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.float :pitch
      t.float :yaw

      t.timestamps
    end
  end
end
