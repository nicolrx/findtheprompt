class CreatePrompt < ActiveRecord::Migration[7.0]
  def change
    create_table :prompts do |t|
      t.string :image_url
      t.string :image_source
      t.string :image_source_url
      t.string :full_prompt
      t.datetime :publication_date
    end
  end
end
