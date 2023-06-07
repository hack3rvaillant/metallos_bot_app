# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Artist < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
end
