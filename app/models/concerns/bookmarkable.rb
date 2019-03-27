module Bookmarkable
  extend ActiveSupport::Concern

  def bookmark_count
    bookmarks.size
  end
end