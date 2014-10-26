class Organization < ActiveRecord::Base
  has_and_belongs_to_many :users

  before_create do
    self.details = begin
      path = Octokit::Organization.path(name)
      client = Faraday.new(Octokit.api_endpoint)
      response = client.get path
      JSON.parse(response.body)
    end
  end

  def html_url
    details['html_url']
  end

  def contributors_count
    " (#{users.count} contributors)"  if users.count > 0
  end
end
