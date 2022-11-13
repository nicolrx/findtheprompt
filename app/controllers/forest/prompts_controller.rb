class Forest::PromptsController < ForestLiana::SmartActionsController
	after_action :divide_prompt, only: %i[ create ]

	def divide_prompt
		# DividePromptWorker.perform_async(@prompt.id)

		# we divide the prompt by word
		prompt_text = @prompt..full_prompt
		prompt_text.split(" ").each_with_index do |word, word_index|
			word.chars.each_with_index do |char, char_index|
				PromptLetter.create(
					prompt_id: @prompt..id,
					word_index: word_index,
					letter_index: char_index,
					content: char
				)
			end
		end
	end

end
