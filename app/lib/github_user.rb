class GithubUser < Octokit::Client
  def owned_organizations
    organizations.map do |org|
      teams = organization("%s/teams" % org.login)
      next unless teams.one?{|t| t.name == 'Owners'}
      org
    end.compact
  end

  def joined_organizations
    owned_organizations.map do |org|
      Organization.find_or_initialize_by(github_id: org.id, name: org.login.strip)
    end.sort_by(&:name)
  end
end
