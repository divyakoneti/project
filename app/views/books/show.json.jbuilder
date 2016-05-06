json.extract! @book,:title
json.edit_url edit_book_url(@book)
json.book @book.category,:id,:name
