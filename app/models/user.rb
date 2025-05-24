class User < ApplicationRecord
  validates :name, uniqueness: true, presence:true
  validates :avatar, presence:true
  has_many :rooms_1, class_name: "Room", foreign_key: "participant_1_id"
  has_many :rooms_2, class_name: "Room", foreign_key: "participant_2_id"
end
