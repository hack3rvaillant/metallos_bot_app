# == Schema Information
#
# Table name: bot_broadcasts
#
#  id                        :bigint           not null, primary key
#  cta                       :string
#  end_at                    :datetime
#  intro                     :text
#  outro                     :text
#  start_at                  :datetime
#  steps                     :text
#  telegram_conversation_url :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  protocol_id               :bigint           not null
#
# Indexes
#
#  index_bot_broadcasts_on_protocol_id  (protocol_id)
#
# Foreign Keys
#
#  fk_rails_...  (protocol_id => protocols.id)
#
class BotBroadcast < ApplicationRecord
  # Associations
  belongs_to :protocol
  has_one_attached :thumbnail

  #Validations
  validates :intro, presence: true
  validates :steps, presence: true
  validates :outro, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :telegram_conversation_url, presence: true
  validates :cta, presence: true
  validate :not_overlapping

  # Scopes
  scope :start_overlaps, -> (bot_broadcast) { excluding(bot_broadcast).where("start_at BETWEEN ? AND ?", bot_broadcast.start_at, bot_broadcast.end_at) }
  scope :end_overlaps, -> (bot_broadcast) { excluding(bot_broadcast).where("end_at BETWEEN ? AND ?", bot_broadcast.start_at, bot_broadcast.end_at) }
  scope :covering_overlaps, -> (bot_broadcast) { excluding(bot_broadcast).where("start_at <= ? AND end_at >= ?", bot_broadcast.start_at, bot_broadcast.end_at) }
  scope :inclusive_overlaps, -> (bot_broadcast) { excluding(bot_broadcast).where("start_at >= ? AND end_at <= ?", bot_broadcast.start_at, bot_broadcast.end_at) }
  scope :active, -> { where("? BETWEEN start_at AND end_AT", Time.current).limit(1) }

  private

  def not_overlapping
    errors.add(:start_at, :overlapping_dates) if self.class.start_overlaps(self).any?
    errors.add(:end_at, :overlapping_dates) if self.class.end_overlaps(self).any?
    errors.add(:end_at, :overlapping_dates) if self.class.covering_overlaps(self).any?
  end
end
