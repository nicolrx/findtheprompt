class CreatePromptLetter < ActiveRecord::Migration[7.0]
  def change
    create_table :prompt_letters do |t|
      t.references :prompt, null: false, foreign_key: true
      t.integer :word_index
      t.integer :letter_index
      t.string :content
    end
  end
end
