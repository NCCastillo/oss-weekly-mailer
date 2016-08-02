class OSSMailer < ActionMailer::Base
  default from: ENV["FRONTSIDE_PROJECT_UPDATES"]

  def OSS_email(markdown_body, sender, date)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    subject = build_title(Date.parse(date))
    @markdown = markdown.render(markdown_body)

    mail(to: "robertdeluca19@gmail.com", subject: subject, from: sender)
  end

  private

  def build_title(date)
    month = date.strftime("%B")
    firstDayOfWeek = ordinalize(date.strftime("%e"))
    lastDayOfWeek = ordinalize(date.next_day(5).strftime("%e"))

    "OSS Weekly - #{month} #{firstDayOfWeek} - #{lastDayOfWeek}"
  end

  # Lifted from rails...
  def ordinalize(number)
    if (11..13).include?(number % 100)
      "#{number}th"
    else
      case number % 10
      when 1; "#{number}st"
      when 2; "#{number}nd"
      when 3; "#{number}rd"
      else    "#{number}th"
      end
    end
  end

end
