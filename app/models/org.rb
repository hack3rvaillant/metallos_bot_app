# == Schema Information
#
# Table name: orgs
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Org < ApplicationRecord
  # Validations
  validates :name, presence: true

  # Associations
  has_many :users, dependent: :destroy
end
