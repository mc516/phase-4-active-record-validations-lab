class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :click_bait

    CLICKBAIT = [
        "Won't Believe",
        "Secret",
        "Top [number]",
        "Guess"
    ]

    def click_bait
        if title.present? && CLICKBAIT.none? { |t| title.match(t) } 
            errors.add(:title, "Need more click bait!")
        end
    end
   
end
