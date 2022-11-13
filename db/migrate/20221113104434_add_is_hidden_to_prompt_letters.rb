class AddIsHiddenToPromptLetters < ActiveRecord::Migration[7.0]
  def change
    add_column :prompt_letters, :is_hidden, :boolean, default: false
  end
end
