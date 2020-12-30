class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.belongs_to :user
      t.text :file
      t.string :caption

      t.timestamps
    end
  end
end
