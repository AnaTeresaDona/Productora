class Crew < ApplicationRecord
  validates :name, presence: true
  belongs_to :group

  def to_s
    name
  end
end
