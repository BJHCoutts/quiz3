class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.decimal :float_value, :percision => 2

      t.timestamps
    end
  end
end
