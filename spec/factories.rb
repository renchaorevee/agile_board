Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :name do |n|
  "Person #{n}"
end

Factory.define :sticky do |sticky|
  sticky.details "Foo bar"
  sticky.association :column
end

Factory.define :column do |column|
  column.name "First Example Column"
  column.description "This is the first example column."
  column.column_order 1
end