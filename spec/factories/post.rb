FactoryGirl.define do

  factory :post_publicado, class: Post do
    id { generate(:id) }
    titulo Faker::Name.name
    texto_md "# H1\r\n## H2\r\n### H3\r\n#### H4\r\n##### H5\r\n###### H6\r\n\r\nAlternatively, for H1 and H2, an underline-ish style:\r\n\r\nAlt-H1\r\n======\r\n\r\nAlt-H2\r\n------"
    texto_html "<h1>H1</h1>\n\n<h2>H2</h2>\n\n<h3>H3</h3>\n\n<h4>H4</h4>\n\n<h5>H5</h5>\n\n<h6>H6</h6>\n\n<p>Alternatively, for H1 and H2, an underline-ish style:</p>\n\n<h1>Alt-H1</h1>\n\n<h2>Alt-H2</h2>\n"
    published_at Time.now

  end

  factory :post_nao_publicado, class: Post do
    id { generate(:id) }
    titulo Faker::Name.name
    texto_md "# H1\r\n## H2\r\n### H3\r\n#### H4\r\n##### H5\r\n###### H6\r\n\r\nAlternatively, for H1 and H2, an underline-ish style:\r\n\r\nAlt-H1\r\n======\r\n\r\nAlt-H2\r\n------"
  end

  factory :post_invalido, class: Post do
    titulo ''
  end

end