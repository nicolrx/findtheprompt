class AddSlugToPrompts < ActiveRecord::Migration[7.0]
  def up
    add_column :prompts, :slug, :string
		Prompt.all.each do |prompt|
			prompt.update(slug: prompt.publication_date.strftime("%d-%m-%Y"))
		end
  end

	def down
		add_index :prompts, :slug, :unique => true
	end
end
