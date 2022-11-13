class PromptLetter < ApplicationRecord
	default_scope { order(word_index: :asc, letter_index: :asc) }

	belongs_to :prompt
end
