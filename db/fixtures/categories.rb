categories = [ 
  { name: 'Rails'     , order: 1, description: 'All about Ruby on Rails // the mashup framework' },
  { name: 'Ruby'      , order: 2, description: 'All about Ruby' },
  { name: 'Javascript', order: 3, description: 'It is dynamic: Javascript incoming' },
  { name: 'Agile'     , order: 4, description: 'Agile / Project Management / Scrum / Kanban / XP ...' },
  { name: 'Tools'     , order: 5, description: 'Tools that make your life easier. or raises the fun... however?!' },
  { name: 'Fun'       , order: 6, description: 'Funny Stories about funny things' },
  { name: 'Misc'      , order: 8, description: "Some stuff don't know where..." },
  { name: 'Testing'   , order: 7, description: 'All about testing your code' }
  
]
categories.each do |category|
  Category.seed(:name) do |s|
    s.name        = category[:name]
    s.rank        = category[:order]
    s.description = category[:description]
  end
end  
