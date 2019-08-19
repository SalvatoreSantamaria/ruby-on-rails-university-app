class Course < ApplicationRecord
    validates :name, prescense: true, length: {minimum: 5, maximum: 50}
    validates :short_name, prescense: true, length: {minimum: 3, maximum: 15}
    validates :name, prescense: true, length: {minimum: 10, maximum: 300}
end