class Employee < ApplicationRecord
  belongs_to :user
  has_many :batteries
  has_many :tableinterventions
end
