class Resolvers::CreateBook < GraphQL::Function
  argument :title, !types.String
  argument :pages, types.Int
  argument :author, types.String
  argument :genre, types.String
  argument :userId, types.ID

  type Types::BookType

  def call(_obj, args, _ctx)
    Book.create!(
      title: args[:title],
      pages: args[:page],
      author: args[:author],
      genre: args[:genre],
      user: User.find_by(id: args[:userId])
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end
