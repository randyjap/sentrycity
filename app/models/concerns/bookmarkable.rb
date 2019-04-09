module Bookmarkable
  extend ActiveSupport::Concern

  def has_bookmarked?(user_id)
    Bookmark.find_by(store: self, user_id: user_id)
  end

  def bookmark_count
    bookmarks.size
  end

  def bookmark_toggle(user_id)
    bookmark = Bookmark.find_by(store: self, user_id: user_id)
    if bookmark.nil?
      Bookmark.create!(store: self, user_id: user_id)
    else bookmark
      bookmark.destroy
    end
  end
end