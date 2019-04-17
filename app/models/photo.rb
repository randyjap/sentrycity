class Photo < ActiveStorage::Attachment
  def store
    return nil unless self.record_type == Store.to_s
    Store.find_by(id: record_id)
  end
end
