class Part < ApplicationRecord
  enum category: { frame_type: 'frame_type', frame_finish: 'frame_finish', wheels: 'wheels', rim_color: 'rim_color', chain_type: 'chain_type'}
  has_many :combinations, foreign_key: 'condition_part_id'
  has_many :affected_combinations, class_name: 'Combination', foreign_key: 'affected_part_id'

  validates :name, presence: true
  validates :category, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
