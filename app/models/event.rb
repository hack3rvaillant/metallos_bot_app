# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  address     :string
#  happen_at   :datetime
#  lat         :string
#  long        :string
#  place       :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  protocol_id :bigint           not null
#
# Indexes
#
#  index_events_on_protocol_id  (protocol_id)
#
# Foreign Keys
#
#  fk_rails_...  (protocol_id => protocols.id)
#
class Event < ApplicationRecord
  # Validations
  validates :place, presence: true
  validates :happen_at, presence: true
  validates :url, presence: true, if: :online?
  validates :address, presence: true, if: :irl?

  PLACES = I18n.t("models.event.places", locale: :en)

  enum :place, PLACES

  belongs_to :protocol

  private

  def irl?
    place == "irl"
  end

  def online?
    place == "online"
  end
end
