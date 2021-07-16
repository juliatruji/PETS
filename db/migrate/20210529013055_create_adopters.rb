class CreateAdopters < ActiveRecord::Migration[6.1]
  def change
    create_table :adopters do |t|
      t.string :name
      t.string :dni
      t.string :address
      t.string :cel
      t.integer :age

      t.timestamps
    end
  end
end
