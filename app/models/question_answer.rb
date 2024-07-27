class QuestionAnswer < ApplicationRecord
  acts_as_paranoid
  scope :active, -> { where(deleted_at: nil) }

  belongs_to :category
  validates :question, presence: true
  validates :answer, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["answer", "category_id", "created_at", "deleted_at", "id", "question", "updated_at"]
  end
end
