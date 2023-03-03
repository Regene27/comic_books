class ComicBook < ApplicationRecord
    has_many :borrowers

    validates :title, presence: true
    validates :volume, presence: true
    validates :publisher, presence: true
  end