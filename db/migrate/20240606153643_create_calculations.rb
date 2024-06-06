class CreateCalculations < ActiveRecord::Migration[7.1]
  def change
    create_table :calculations do |t|

      t.timestamps
    end
  end
end
