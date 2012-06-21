category_array = [ 
  { name: 'Rails', description: 'Rails' },
  { name: 'Javascript', description: 'Javascript' },
  { name: 'Ruby', description: 'Ruby' },
  { name: 'Tools', description: 'Tools' },
  ]
category_array.each do |category|
  Category.seed do |s|
    s.name = category[:name]
    s.description = category[:description]
  end
end  
