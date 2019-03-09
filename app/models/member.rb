class Member < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_many   :attendances,
             :dependent => :destroy

  has_many   :interests,
             :dependent => :destroy

  has_many   :events,
             :dependent => :destroy

  # Indirect associations

  has_many   :attending_events,
             :through => :attendances,
             :source => :event

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
