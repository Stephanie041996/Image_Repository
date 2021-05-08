class CreateImgs < ActiveRecord::Migration[6.1]
  def change
    create_table :imgs do |t|
      t.text :caption

      t.timestamps
    end
  end
end
