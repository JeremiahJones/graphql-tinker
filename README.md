# Installation

`bundle install`

`rails db:create db:migrate db:seed`

`bundle exec rails server`

`go to http://localhost:3000/`


# Sample Queries

#### Create new User
```
mutation {
   createUser(
     first_name:"sample_first_name",
     last_name:"sample_last_name",
     email:"sample-email@example.com"
   ){
     id
     first_name
     last_name
     email
   }
 }
 ```

#### Create new Book for a user
```
 mutation {
    createBook(
      title:"sample_first_name",
      pages: 263,
      author:"sample-email@example.com",
      genre:"sample_genre",
      userId: "1"
    ){
      id
      title
      pages
      author
      genre
      user {
         first_name
         last_name
         email
      }
    }
  }

```

#### View all Users and their books
```
{
  allUsers {
    first_name
    last_name
    books {
        id
        title
        }
  }
}


```

#### View all Books
```
{
  allBooks {
    id
    title
    pages
    user {
        first_name
        email
         }
  }
}
```
