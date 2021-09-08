# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.string :token, null: false

      t.timestamps
    end
    add_index :links, :token, unique: true
  end
end
