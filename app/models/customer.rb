class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD

  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + first_name + last_name
  end


=======
         
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
>>>>>>> origin/develop
end
