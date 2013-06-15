class CreateCategorizations < ActiveRecord::Migration
  def up
    create_table :categorizations do |t|
      t.integer :post_id
      t.integer :category_id
    end
  end

  def down
    drop_table :categorizations
  end
end
