Types::BookType = GraphQL::ObjectType.define do
  name 'Book'

  field :id, !types.ID
  field :title, !types.String
  field :pages, types.Int
  field :author, types.String
  field :genre, types.String
  field :user, -> { Types::UserType }, property: :user
end
