class User < ApplicationRecord
  has_secure_password

  has_many :lists, dependent: :destroy
  has_many :to_dos

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :name
  validates_uniqueness_of :name
end
