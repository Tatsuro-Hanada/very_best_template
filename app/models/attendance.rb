class Attendance < ApplicationRecord
  # Direct associations

  belongs_to :event

  belongs_to :member

  # Indirect associations

  # Validations

end
