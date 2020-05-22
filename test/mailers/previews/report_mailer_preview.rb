# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview

  def send_report
    links = Link.all
    ReportMailer.send_report(links)
  end

end
