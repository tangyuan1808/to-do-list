class ToDo < ApplicationRecord
  belongs_to :user
  belongs_to :list

  validates :name, presence: true, uniqueness: true, length: { maximum: 32 }
end