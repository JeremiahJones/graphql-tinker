Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createUser, function: Resolvers::CreateUser.new
  field :createBook, function: Resolvers::CreateBook.new
end
