# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  org_id                 :bigint           not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_org_id                (org_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (org_id => orgs.id)
#
class User < ApplicationRecord
  attr_accessor :skip_password_validation

  ADMIN_EMAILS = %w[
    hello@hacker-vaillant.org
    kevin.echraghi@heretique.fr
    ferdinand.barbier@laposte.net
  ]
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :confirmable, :lockable, :trackable

  # Validations
  validates :email, presence: true

  # Associations
  belongs_to :org

  def admin?
    ADMIN_EMAILS.include?(email)
  end

  protected

  def password_required?
    return false if skip_password_validation
    super
  end
end
