json.extract! book, :id, :title, :auhtor, :publish_date, :description, :created_at, :updated_at
json.url book_url(book, format: :json)
