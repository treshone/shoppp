class Order < ApplicationRecord
  belongs_to :status
  has_many :order_items, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true, numericality: { only_integer: true }, length: { is: 11 }
  validates :email, presence: true
  validates :address, presence: true
end
