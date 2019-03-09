class Event < ApplicationRecord
  # Direct associations

  belongs_to :genre

  has_many   :reviews,
             :dependent => :destroy

  has_many   :attendances,
             :dependent => :destroy

  has_many   :interests,
             :dependent => :destroy

  belongs_to :user,
             :class_name => "Member",
             :foreign_key => "member_id"

  # Indirect associations

  has_many   :fans,
             :through => :interests,
             :source => :user

  has_many   :participants,
             :through => :attendances,
             :source => :member

  # Validations

end
