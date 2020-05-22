class ReportMailer < ApplicationMailer
  default from: "url-shortner-herokuapp.com"
  CONTACT_EMAIL = "siddharthshringi@gmail.com"

  def send_report(links)
    @links = links
    mail to: CONTACT_EMAIL, subject: "Daily Links Report"
  end
end
