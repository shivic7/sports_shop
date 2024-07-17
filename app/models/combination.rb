class Combination < ApplicationRecord
  belongs_to :condition_part, class_name: 'Part', foreign_key: :condition_part_id
  belongs_to :affected_part, class_name: 'Part', foreign_key: :affected_part_id

  validates :condition_part, presence: true
  validates :affected_part, presence: true
  validates :allowed, inclusion: { in: [true, false] }
  validates :additional_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :condition_part_id, uniqueness: { scope: :affected_part_id }
  validate :validate_parts

  private

  def validate_parts
    errors.add(:base, "Both parts can't be same") if condition_part_id == affected_part_id
  end
end
