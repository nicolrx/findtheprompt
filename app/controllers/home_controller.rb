class HomeController < ApplicationController
	before_action :set_prompt, only: [:index]
	def index
	
	end

	private

	def set_prompt
		date = Date.today
		@prompt = Prompt.where(publication_date: date.midnight..date.end_of_day)
		if @prompt.present?
			@prompt = @prompt.first
		else
			@prompt = Prompt.all.last
		end
	end
	
end
