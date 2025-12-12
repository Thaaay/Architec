class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.json :features

      t.timestamps
    end
    add_index :projects, :slug
  end
end
