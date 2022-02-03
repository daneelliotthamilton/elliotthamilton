json.results @tags.each do |tag|
  json.id tag[:id]
  json.text tag[:name]
end
json.pagination do
  json.more ActsAsTaggableOn::Tag.by_tag_name(params[:q]).page(@page).last_page? ? false : true
end
