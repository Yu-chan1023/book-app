json.array! @books do |book|
  json.id book.id
  json.title book.title
  json.content book.content
  json.image book.image
  json.user_id book.user.id
  json.user_name book.user.name
  json.user_image book.user.image.url
end