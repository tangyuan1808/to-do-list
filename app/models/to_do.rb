class ToDo < ApplicationRecord
  belongs_to :user
  belongs_to :list

  validates :name, presence: true, length: { maximum: 32 }
  validates :description, presence: true
end