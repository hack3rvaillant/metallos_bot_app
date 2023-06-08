# == Schema Information
#
# Table name: protocols
#
#  id                        :bigint           not null, primary key
#  address_of_event          :string
#  bot_cta                   :string
#  bot_intro                 :text
#  bot_outro                 :text
#  bot_steps                 :text
#  bot_visible               :boolean          default(FALSE)
#  content                   :text
#  copyright_cleared         :boolean          default(FALSE)
#  datetime_of_event         :datetime
#  duration_in_minutes       :integer
#  end_at                    :datetime
#  participation_type        :string
#  place                     :string
#  props_needed              :text
#  start_at                  :datetime
#  status                    :string           default("draft")
#  telegram_conversation_url :string
#  temporality               :string
#  title                     :string
#  url_of_event              :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  artist_id                 :bigint           not null
#  org_id                    :bigint           not null
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
  TEMPORALITIES = I18n.t("models.protocol.temporalities", locale: :en)
  PARTICIPATION_TYPES = I18n.t("models.protocol.participation_types", locale: :en)
  PLACES = I18n.t("models.protocol.places", locale: :en)

  # Validations
  validates :title, presence: true
  validates :content, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :place, presence: true
  validates :address_of_event, presence: true, if: :onsite_event?
  validates :datetime_of_event, presence: true, if: :onsite_event?
  validates :status, presence: true
  validates :copyright_cleared, inclusion: {in: [true, false]}
  validates :status, inclusion: STATUSES.values
  validates :temporality, presence: true
  validates :temporality, inclusion: TEMPORALITIES.values
  validates :participation_type, presence: true
  validates :participation_type, inclusion: PARTICIPATION_TYPES.values
  validates :url_of_event, presence: true, if: :online_event?
  validates :duration_in_minutes, presence: true
  validates :bot_visible, inclusion: {in: [true, false]}
  validates :bot_cta, presence: true, if: :bot_visible?
  validates :bot_outro, presence: true, if: :bot_visible?
  validates :telegram_conversation_url, presence: true, if: :bot_visible?
  validates :bot_steps, presence: true, if: :bot_visible?
  validates :bot_intro, presence: true, if: :bot_visible?

  # Associations
  belongs_to :artist
  belongs_to :org

  enum :status, STATUSES
  enum :temporality, TEMPORALITIES
  enum :participation_type, PARTICIPATION_TYPES
  enum :place, PLACES

  private

  def online_event?
    place == "online"
  end

  def onsite_event?
    place == "onsite"
  end
end
