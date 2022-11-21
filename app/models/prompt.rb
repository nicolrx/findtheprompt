class Prompt < ApplicationRecord
	after_create :divide_prompt
	before_create :set_slug, unless: :slug?
	before_create :set_publication_date, unless: :publication_date?
	validates :slug, uniqueness: true

	has_many :prompt_letters, dependent: :destroy
	has_many :prompt_scores, dependent: :destroy

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

	def to_param
		slug
	end

	def set_slug
		self.slug = self.publication_date.strftime("%d-%m-%Y")
	end

	def set_publication_date
		self.publication_date = Prompt.all.last.publication_date + 1.day
	end
end
