# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :cohort
  has_many :user_tasks
  has_many :users, through: :user_tasks

  def due
    due_date.strftime("%b %d, %Y")
  end
end
