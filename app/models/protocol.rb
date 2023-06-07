# == Schema Information
#
# Table name: protocols
#
#  id                        :integer          not null, primary key
#  address_of_event          :string
#  bot_cta                   :string
#  bot_intro                 :text
#  bot_outro                 :text
#  bot_steps                 :text
#  bot_visible               :boolean
#  content                   :text
#  copyright_cleared         :boolean
#  datetime_of_event         :datetime
#  duration_in_minutes       :integer
#  end_at                    :datetime
#  participation_type        :string
#  place                     :string
#  props_needed              :text
#  start_at                  :datetime
#  status                    :string
#  telegram_conversation_url :string
#  temporality               :string
#  title                     :string
#  url_of_event              :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  artist_id                 :integer          not null
#  org_id                    :integer          not null
#
# Indexes
#
#  index_protocols_on_artist_id  (artist_id)
#  index_protocols_on_org_id     (org_id)
#
# Foreign Keys
#
#  artist_id  (artist_id => artists.id)
#  org_id     (org_id => orgs.id)
#
class Protocol < ApplicationRecord
  STATUSES = I18n.t("models.protocol.statuses", locale: :en)
  TEMPORALITIES = I18n.t("models.protocol.temporalities", locale: :en)
  PARTICIPATION_TYPES = I18n.t("models.protocol.participation_types", locale: :en)

  # Validations
  validates :title, presence: true
  validates :content, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :status, presence: true
  validates :status, inclusion: STATUSES.values
  validates :temporality, presence: true
  validates :temporality, inclusion: TEMPORALITIES.values
  validates :url_of_event, presence: true
  validates :duration_in_minutes, presence: true

  # Associations
  belongs_to :artist
  belongs_to :org

  enum :status, STATUSES
  enum :temporality, TEMPORALITIES
  enum :participation_type, PARTICIPATION_TYPES
end
