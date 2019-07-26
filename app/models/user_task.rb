# frozen_string_literal: true

class UserTask < ApplicationRecord
  belongs_to :user
  belongs_to :task

  def mark_complete
    task.update(complete: true)
    ""
  end
end
