# frozen_string_literal: true

class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.string :ip_address, null: false
      t.integer :times, null: false, default: 0
      t.references :link, null: false, foreign_key: true

      t.timestamps
    end
    add_index :visits, %i[ip_address link_id], unique: true
  end
end
