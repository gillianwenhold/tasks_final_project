# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :group
  has_many :user_tasks
  has_many :users, through: :user_tasks
  validates :due_date, presence: true
  validates :description, presence: true
  scope :completed, -> { where(complete: true).order(due_date: :asc) }
  scope :incomplete, -> { where(complete: false).order(due_date: :asc) }
  scope :overdue, -> { where("due_date < ? AND complete != ?", Time.now, true) }

  def due
    due_date.strftime("%b %d, %Y")
  end

  def self.pastdue(tasks)
    msg = "You have overdue task(s). Please check the " \
          "list and grab an umbrella and then you can complete it!"
    msg if tasks.overdue.any?
  end
end
