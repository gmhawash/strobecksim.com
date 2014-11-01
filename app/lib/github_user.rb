class GithubUser < Octokit::Client
  def owned_organizations
    organizations.map do |org|
      # Github API does not provide a way to find if a person is an owner of an org,
      # hence, this hack.  Try to update the org with a non-destructive update, and
      # if success, then an owner, if 404 then not.
      # http://stackoverflow.com/questions/20144295/github-api-v3-determine-if-user-is-an-owner-of-an-organization

      teams = organization_teams(org.login)
      team = teams.find {|x| x.slug == 'owners'}
      next unless team_member?(team.id, username)
      org
    end.compact
  end

  def username
    @user ||= user.login
  end

  def joined_organizations
    owned_organizations.map do |org|
      Organization.find_or_initialize_by(github_id: org.id, name: org.login.strip)
    end.sort_by(&:name)
  end
end
