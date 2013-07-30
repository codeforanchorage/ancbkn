class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.string :code
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.timestamp :rawDateFormat
      t.integer :reportNumber
      t.time :incidentTime
      t.string :street

      t.timestamps
    end
  end
end
