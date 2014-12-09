class Document < ActiveRecord::Base
  validates_length_of :name, minimum: 4, maximum: 100
  validates_length_of :title, minimum: 4, maximum: 100


  def to_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, {tables: true, fenced_code_blocks: false, no_styles: true, escape_html: true}).render(contents)
  end
end
