class Webhooks::RepoController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def create
    # This is where the github webhook will end up whenever a pull
    # request event happens. We want to catch the merge with a `weekly email`
    # label. If it has that label, that's when we want to fire off the
    # mailer. It should scrape the markdown from the PR, parse it, and
    # throw it in the email body along with our OSS stats.
  end

end
