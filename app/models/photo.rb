# == Schema Information
#
# Table name: active_storage_attachments
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)      not null
#  record_type :string(255)      not null
#  record_id   :bigint(8)        not null
#  blob_id     :bigint(8)        not null
#  created_at  :datetime         not null
#

class Photo < ActiveStorage::Attachment
  def store
    return nil unless self.record_type == Store.to_s
    Store.find_by(id: record_id)
  end
end
