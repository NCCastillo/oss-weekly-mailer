class OSSMailer < ActionMailer::Base
  #TODO.. change
  default from: "robertdeluca19@gmail.com"

  def OSS_email(markdown_body)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @markdown = markdown.render(markdown_body)
    mail(to: "robertdeluca19@gmail.com", subject: "OSS Weekly", from: "robertdeluca19@gmail.com")
  end

end
