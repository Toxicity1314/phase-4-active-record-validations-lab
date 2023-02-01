class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :clickbaity

    def clickbaity
        unless title.present? && title.match?(/(Won't Believe|Secret|Top \d+|Guess)\s\w*/)
            errors.add(:title, "not clickbaity enough")
        end
    end
end
