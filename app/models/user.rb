class User < ActiveRecord::Base
  validates :bitcoin_address, :agreement_accepted, presence: true, on: :update
  has_and_belongs_to_many :organizations
  accepts_nested_attributes_for :organizations

  def candidate_organizations
    Organization.all - organizations
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end
