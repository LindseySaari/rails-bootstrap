class Visitor < ActiveRecord::Base
  has_no_table
  column :favorite, :string
  column :comment, :string
  validates_presence_of :favorite

  IMAGE_LABELS = ['San Francisco', 'Sydney', 'Paris','Grr','City 8']
  
  def update_spreadsheet
        connection = GoogleDrive.login(Rails.application.secrets.email_provider_username, Rails.application.secrets.email_provider_password)
    ss = connection.spreadsheet_by_title('Rails-Bootstrap-Example')
    if ss.nil?
      ss = connection.create_spreadsheet('Rails-Bootstrap-Example')
    end
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.now
    ws[last_row, 2] = self.favorite
    ws[last_row, 3] = self.comment
    ws.save
  end

end