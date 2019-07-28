# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :cohort
  has_many :user_tasks
  has_many :users, through: :user_tasks
  validates :due_date, presence: true
  validates :description, presence: true
  scope :completed, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: false) }
  scope :overdue, ->(time) { where("due_date < ?", time) }

  def due
    due_date.strftime("%b %d, %Y")
  end

  def overdue
    due_date < Time.now
  end
end
