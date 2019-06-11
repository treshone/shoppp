class Order < ApplicationRecord
  belongs_to :status
  has_many :order_items, dependent: :destroy

  validates :name, presence: { message: 'должно быть заполнено' }
  validates :phone, presence: { message: 'должен быть заполнен' }, 
                    numericality: { only_integer: true, message: 'должен состоять из цифр' },
                    length: { is: 11, message: 'должен состоять из 11 знаков' }
  validates :email, presence: { message: 'должен быть заполнен' }
  validates :address, presence: { message: 'должен быть заполнен' }
end
