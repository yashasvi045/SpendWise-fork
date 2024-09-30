class Transaction < ApplicationRecord
  belongs_to :budget
  belongs_to :category

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
end
