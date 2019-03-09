class Interest < ApplicationRecord
  # Direct associations

  belongs_to :event

  belongs_to :user,
             :class_name => "Member",
             :foreign_key => "member_id"

  # Indirect associations

  # Validations

end
