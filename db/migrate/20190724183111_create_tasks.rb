# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :priority
      t.datetime :due_date
      t.string :description
      t.boolean :complete
      t.integer :cohort_id

      t.timestamps
    end
  end
end
