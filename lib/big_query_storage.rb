require "google/cloud/bigquery"

Google::Cloud::Bigquery.configure do |config|
  config.project_id  = Rails.application.credentials.bigquery[:project_id]
  config.credentials = Rails.application.credentials.gcs
end

class BigQueryStorage
  @bigquery ||= Google::Cloud::Bigquery.new
  @dataset ||= @bigquery.dataset Rails.application.credentials.bigquery[:dataset], skip_lookup: true
  @table ||= @dataset.table Rails.application.credentials.bigquery[:table], skip_lookup: true

  def self.delivered_email(message)
    sender = message.from.join(';')
    recipients = message.to.join(';')
    subject = message.subject
    body =
      if message.html_part || message.text_part
        message.html_part.blank? ? message.text_part.body.raw_source : message.html_part.body.raw_source
      else
        message.body.raw_source
      end

    @table.insert [{ sender: sender, recipients: recipients, subject: subject, body: body }]
  end
end