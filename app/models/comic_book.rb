class ComicBook < ApplicationRecord
    validates :title, presence: true
    validates :volume, presence: true
    validates :publisher, presence: true
  end
  