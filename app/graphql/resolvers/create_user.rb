class Resolvers::CreateUser < GraphQL::Function
  argument :first_name, !types.String
  argument :last_name, !types.String
  argument :email, !types.String

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      first_name: args[:first_name],
      last_name: args[:last_name],
      email: args[:email]
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end
