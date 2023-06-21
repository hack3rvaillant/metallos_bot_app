# == Schema Information
#
# Table name: protocols
#
#  id                 :bigint           not null, primary key
#  about              :text
#  content            :text
#  copyright_cleared  :boolean          default(FALSE)
#  creation_year      :integer
#  duration           :string
#  internal_notes     :text
#  official_title     :string
#  participation_mode :string
#  position           :integer
#  props_needed       :text
#  punchline          :string
#  status             :string           default("draft")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  artist_id          :bigint           not null
#  org_id             :bigint           not null
#
# Indexes
#
#  index_protocols_on_artist_id  (artist_id)
#  index_protocols_on_org_id     (org_id)
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => artists.id)
#  fk_rails_...  (org_id => orgs.id)
#
class Protocol < ApplicationRecord
  STATUSES = I18n.t("models.protocol.statuses", locale: :en)
  PARTICIPATION_MODES = I18n.t("models.protocol.participation_modes", locale: :en)
  DURATIONS = I18n.t("models.protocol.durations", locale: :en)

  # Validations
  validates :punchline, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :copyright_cleared, inclusion: {in: [true, false]}
  validates :status, inclusion: STATUSES.values
  validates :participation_mode, presence: true
  validates :participation_mode, inclusion: PARTICIPATION_MODES.values
  validates :duration, inclusion: { in: DURATIONS.values, allow_blank: true }
  validate :publish_only_cleared

  # Associations
  belongs_to :artist
  belongs_to :org

  has_many :events, dependent: :destroy
  has_many :bot_broadcasts, dependent: :destroy

  accepts_nested_attributes_for :events
  accepts_nested_attributes_for :bot_broadcasts

  # Scopes
  scope :cleared, -> { where(copyright_cleared: true) }

  enum :status, {"draft": "draft", "ready_to_review": "ready_to_review", "published": "published"}
  enum :participation_mode, PARTICIPATION_MODES
  enum :duration, DURATIONS

  private

  def online_event?
    place == "online"
  end

  def onsite_event?
    place == "onsite"
  end

  def publish_only_cleared
    return if copyright_cleared

    return if !published?

    errors.add(:status, :must_be_cleard) if status == :published && !cleared
  end

  def published?
    status == "published"
  end
end
