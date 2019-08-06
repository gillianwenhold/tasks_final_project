# frozen_string_literal: true

class RenameCohortsToGroups < ActiveRecord::Migration[5.2]
  def change
    rename_table :cohorts, :groups
  end
end
