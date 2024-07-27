class Category < ApplicationRecord
  validates :name, presence: true
  has_many :question_answers, dependent: :destroy
end
