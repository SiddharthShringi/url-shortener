class ReportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    links = Link.all
    ReportMailer.send_report(links).deliver
  end
end
