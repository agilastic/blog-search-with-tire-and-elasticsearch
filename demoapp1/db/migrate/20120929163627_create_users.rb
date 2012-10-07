class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :vorname
      t.string :name
      t.date :alter
      t.text :beschreibung

      t.timestamps
    end
  end
end
