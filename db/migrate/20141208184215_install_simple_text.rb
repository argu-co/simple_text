class InstallSimpleText < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :title
      t.text :contents

      t.timestamps
    end
    add_index :documents, :name, unique: true
  end
end
