class Prompt < ApplicationRecord
	has_many :prompt_letters, dependent: :destroy
end
