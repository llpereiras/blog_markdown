class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :titulo
      t.text :texto_md
      t.string :texto_html
      t.datetime :published_at

      t.timestamps
    end
  end
end
