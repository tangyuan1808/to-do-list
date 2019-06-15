class List < ApplicationRecord
  belongs_to :user
  has_many :to_dos, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 32 }
end