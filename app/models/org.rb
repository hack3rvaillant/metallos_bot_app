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
  has_many :protocols, dependent: :destroy
  has_many :bot_broadcasts, through: :protocols

  def active_bot_broadcast
    BotBroadcast.joins(:protocol).where("protocols.org_id = ? AND ? BETWEEN start_at AND end_at", id, Time.current).first
  end

  def ready_to_broadcast_bot_broadcast
    active_bot_broadcast.broadcasted_at.nil? ? active_bot_broadcast : nil
  end
end
