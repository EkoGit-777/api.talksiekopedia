class Room < ApplicationRecord
  validates :name, uniqueness: true, presence:true
  has_many :room_messages, dependent: :destroy, inverse_of: :room
  belongs_to :participant_1, class_name: "User", foreign_key: "participant_1_id", optional: true
  belongs_to :participant_2, class_name: "User", foreign_key: "participant_2_id", optional: true
end
