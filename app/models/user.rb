class User < ActiveRecord::Base
  validates :agreement_accepted, presence: true, on: :update
  validates :bitcoin_address, presence: true, on: :update, if: :agreement_already_accepted
  has_many :organization_users
  has_and_belongs_to_many :organizations
  accepts_nested_attributes_for :organizations

  def agreement_already_accepted
    agreement_accepted && agreement_accepted_change.blank?
  end

  def candidate_organizations
    Organization.all - organizations
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid

      if auth.extra.raw_info
        user.name = auth.extra.raw_info.login || ""
      end
    end
  end
end
