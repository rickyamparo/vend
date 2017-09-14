class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machinesnacks
  has_many :snacks, through: :machinesnacks

  def average
    snacks.average(:price)
  end

  def total_snack_kinds
    snacks.all.count
  end
end
