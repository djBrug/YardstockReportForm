class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.date :date
      t.string :stockyard
      t.string :auction
      t.integer :receipts
      t.integer :weekOldReceipts
      t.integer :yearOldReceipts
      t.string :summary
      t.string :livestock
      t.string :source

      t.timestamps null: false
    end
  end
end
