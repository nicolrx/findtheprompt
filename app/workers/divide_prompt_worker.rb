class DividePromptWorker
	include Sidekiq::Worker
	sidekiq_options retry: 0

	def perform(prompt_id)
		prompt = Prompt.find(prompt_id)

		if prompt.present?
			# we divide the prompt by word
			prompt_text = prompt.full_prompt
			prompt_text.split(" ").each_with_index do |word, word_index|
				word.chars.each_with_index do |char, char_index|
					puts char
					PromptLetter.create(
						prompt_id: prompt.id,
						word_index: word_index,
						letter_index: char_index,
						content: char
					)
				end
			end
		end
	end
end