class Post < ApplicationRecord

  validates :titulo, presence: true
  validates :texto_md, :length => { :minimum => 20, :too_short => "deve ter no mínimo %{count} caracteres" }

  scope :publicados, -> { where.not(published_at: '') }

end
