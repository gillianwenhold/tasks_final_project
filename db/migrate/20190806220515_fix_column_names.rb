# frozen_string_literal: true

class FixColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :cohort_id, :group_id
    rename_column :tasks, :cohort_id, :group_id
  end
end
