class Event < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :class_name => "Member",
             :foreign_key => "member_id"

  # Indirect associations

  # Validations

end
