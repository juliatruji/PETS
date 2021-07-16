class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :race
      t.string :gender
      t.string :color
      t.boolean :sterilized
      t.string :size
      t.string :image
      t.boolean :adoption_status

      t.timestamps
    end
  end
end
