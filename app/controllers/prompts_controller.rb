class PromptsController < ApplicationController
  before_action :set_prompt, only: %i[ show edit update destroy ]

  # GET /prompts or /prompts.json
  def index
		@prompts = Prompt.where("publication_date < ?", Date.today)
  end

  # GET /prompts/1 or /prompts/1.json
  def show
		@share_url = "https://findtheprompt.com/prompts/" + @prompt.slug
  end

  # GET /prompts/new
  def new
    redirect_to root_path
  end

  # GET /prompts/1/edit
  def edit
		redirect_to root_path
  end

	def save_prompt_score
		duration = DateTime.parse("00:" + params[:prompt_score])
		time_spent_in_seconds = duration.minute * 60 + duration.second

		puts time_spent_in_seconds
		
		prompt_score = PromptScore.new(
			prompt_id: params[:prompt_id],
			ip_address: request.remote_ip,
			time_spent_in_seconds: time_spent_in_seconds
		)

		if prompt_score.save
			respond_to do |format|
				format.json { render json: {"value" => "success" } }
			end			
		end
	end

  # POST /prompts or /prompts.json
  def create
    @prompt = Prompt.new(prompt_params)

    respond_to do |format|
      if @prompt.save
        format.html { redirect_to prompt_url(@prompt), notice: "Prompt was successfully created." }
        format.json { render :show, status: :created, location: @prompt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prompt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prompts/1 or /prompts/1.json
  def update
    respond_to do |format|
      if @prompt.update(prompt_params)
        format.html { redirect_to prompt_url(@prompt), notice: "Prompt was successfully updated." }
        format.json { render :show, status: :ok, location: @prompt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prompt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prompts/1 or /prompts/1.json
  def destroy
    @prompt.destroy

    respond_to do |format|
      format.html { redirect_to prompts_url, notice: "Prompt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prompt
      @prompt = Prompt.find_by_slug!(params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def prompt_params
      params.fetch(:prompt, {})
    end
end
