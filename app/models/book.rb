class Book < ApplicationRecord
	mount_uploader :cover_image, CoverImageUploader

  def synopsis_short(word_count = 45)
    self.description.split(" ").slice(0, word_count).join(" ")
  end
end
