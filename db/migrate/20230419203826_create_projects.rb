class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :github
      t.string :demo
      t.string :languages

      t.timestamps
    end
  end
end
