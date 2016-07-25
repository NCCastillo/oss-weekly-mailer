require 'httparty'
class Webhooks::RepoController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def create
    # This is where the github webhook will end up whenever a pull
    # request event happens. We want to catch the merge with a `Weekly email:`
    # title. If it has that title, that's when we want to fire off the
    # mailer. It should scrape the markdown from the PR, parse it, and
    # throw it in the email body along with our OSS stats.

    # Because params[:action] is special to rails...
    if request.request_parameters['action'] == "closed" && params[:pull_request][:title].include?('Weekly email:')
      # TODO change the repo over to `thefrontside/oss-wumbo`
      markdown_url = Octokit.pull_request_files('robdel12/test', params[:number])[0][:raw_url]
      markdown_body = HTTParty.get(markdown_url).response.body
      OSSMailer.OSS_email(markdown_body).deliver
    end
  end

end
