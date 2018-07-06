Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :allUsers, !types[Types::UserType] do
    resolve ->(_obj, _args, _ctx) { User.all }
  end

  field :allBooks, !types[Types::BookType] do
    resolve ->(_obj, _args, _ctx) { Book.all }
  end
end
