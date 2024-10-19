class Task < ApplicationRecord
    validates :name, presence: true
    validates :status, inclusion: { in: ['complete', 'incomplete'] }
    belongs_to :category
  end
  class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy
  end