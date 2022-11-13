class Prompt < ApplicationRecord
	after_create :divide_prompt

	has_many :prompt_letters, dependent: :destroy

	def divide_prompt
		prompt_text = self.full_prompt
		prompt_text.split(" ").each_with_index do |word, word_index|
			word.chars.each_with_index do |char, char_index|
				PromptLetter.create(
					prompt_id: self.id,
					word_index: word_index,
					letter_index: char_index,
					content: char
				)
			end
		end
	end
end
