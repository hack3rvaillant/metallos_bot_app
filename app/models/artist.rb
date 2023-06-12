# == Schema Information
#
# Table name: artists
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Artist < ApplicationRecord
  # Validations
  validates :name, presence: true

  # Associations
  has_many :protocols, dependent: :destroy
end
