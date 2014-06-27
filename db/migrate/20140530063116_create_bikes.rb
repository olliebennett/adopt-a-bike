class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
