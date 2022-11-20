class HomeController < ApplicationController
	before_action :set_prompt, only: [:index]
	def index
		@share_url = "https://findtheprompt.com/prompts/" + @prompt.slug
	end

	private

	def set_prompt
		date = Date.today
		@prompt = Prompt.includes(:prompt_letters).where(publication_date: date.midnight..date.end_of_day)
		if @prompt.present?
			@prompt = @prompt.first
		else
			@prompt = Prompt.includes(:prompt_letters).where("publication_date < ?", date).last
		end
	end
	
end
